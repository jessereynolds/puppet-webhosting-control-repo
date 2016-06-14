class role::wordpress_server_1 {
  include profile::base

  profile::wordpress {'www.example.com':
    db_name => 'wp_example',
    db_user => 'wp_example',
    db_pass => 'jrhhx7hn',
    aliases => ['example.com', 'foo.example.com'],
  }

  profile::staticweb {'www.flat.example.com':
    aliases => ['flat.example.com'],
  }

}

