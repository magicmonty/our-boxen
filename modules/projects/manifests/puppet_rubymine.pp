class projects::puppet_rubymine {
  boxen::project { 'puppet-rubymine':
    source => 'magicmonty/puppet-rubymine'
  }
  
  file { "/Users/${::luser}/Development/puppet-rubymine":
    ensure => link,
    target => "${boxen::config::srcdir}/puppet-rubymine",
  }
}