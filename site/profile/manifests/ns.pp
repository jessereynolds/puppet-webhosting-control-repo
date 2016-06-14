class profile::ns {
  #class { 'bind':
  #  forwarders => [
  #    '8.8.8.8',
  #    '8.8.4.4',
  #  ],
  #}
}
