class profile::mysql {
  class { '::mysql::server':
    root_password           => 'j4ux7HnEjn',
    remove_default_accounts => true,
    override_options        => $override_options,
  }

  class {'::mysql::bindings':
    php_enable => true,
  }
}
