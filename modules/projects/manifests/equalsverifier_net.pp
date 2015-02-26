class projects::equalsverifier_net {
  boxen::project { 'equalsverifier-net':
    source => 'magicmonty/equalsverifier-net'
  }
  
  file { "/Users/${::luser}/Development/EqualsVerifier":
    ensure => link,
    target => "${boxen::config::srcdir}/equalsverifier-net",
  }
}