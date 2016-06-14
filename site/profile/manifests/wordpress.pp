define profile::wordpress (
  String[1] $servername = $title,
  Array     $aliases    = [],
  String[1] $db_name,
  String[1] $db_user,
  String[1] $db_pass,
) {

  $sitehome = "/home/virtual/${servername}"
  $docroot  = "${sitehome}/www"

  include profile::apache
  include profile::mysql

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

  mysql::db {$db_name:
    user     => $db_user,
    password => $db_pass,
    host     => 'localhost',
    grant    => ['ALL'],
  }

}

