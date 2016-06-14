class profile::apache {
  class {'apache':
    mpm_module => 'prefork',
  }

  class {'apache::mod::php':}
  class {'apache::mod::rewrite':}

  file {'/home/virtual':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

}

