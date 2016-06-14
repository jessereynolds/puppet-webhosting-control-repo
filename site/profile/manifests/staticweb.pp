define profile::staticweb (
  String[1] $servername = $title,
  Array     $aliases    = [],
) {

  $sitehome = "/home/virtual/${servername}"
  $docroot  = "${sitehome}/www"

  include profile::apache

  File {
    mode  => '0644',
    owner => 'root',
    group => 'root',
  }

  file {$sitehome:
    ensure => directory,
  }

  file {$docroot:
    ensure  => directory,
  }

  apache::vhost {$servername:
    docroot       => $docroot,
    port          => '80',
    serveraliases => $aliases,
    override      => ['All'],
    require       => File[$docroot],
  }

}

