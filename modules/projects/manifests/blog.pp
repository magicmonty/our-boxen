class projects::blog {
  boxen::project { 'blog':
    source => 'magicmonty/blog'
  }
  
  file { "/Users/${::luser}/Development/blog":
    ensure => link,
    target => "${boxen::config::srcdir}/blog",
  }
}