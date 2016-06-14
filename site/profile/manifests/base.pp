class profile::base {
  package {[
    'telnet',
    'tree',
    'unzip',
    'whois',
    ]:
    ensure => present,
  }

  # I'm running puppet in apply mode (no daemons) on the DO vms
  service {'puppet':
    ensure => stopped,
    enable => false,
  }

  service {'pxp-agent':
    ensure => stopped,
    enable => false,
  }

  service {'mcollective':
    ensure => stopped,
    enable => false,
  }

}
