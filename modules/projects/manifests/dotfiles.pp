class projects::dotfiles {
  boxen::project { 'dotfiles':
    source => 'magicmonty/dotfiles'
  }
  
  file { "/Users/${::luser}/.editorconfig":
    ensure => link,
    target => "${boxen::config::srcdir}/dotfiles/.editorconfig",
  }
  
  file { "/Users/${::luser}/.go-version":
    ensure => link,
    target => "${boxen::config::srcdir}/dotfiles/.go-version",
  }
  
  file { "/Users/${::luser}/.node-version":
    ensure => link,
    target => "${boxen::config::srcdir}/dotfiles/.node-version",
  }
  
  file { "/Users/${::luser}/.ruby-version":
    ensure => link,
    target => "${boxen::config::srcdir}/dotfiles/.ruby-version",
  }
  
  file { "/Users/${::luser}/.vim":
    ensure => link,
    target => "${boxen::config::srcdir}/dotfiles/.vim",
  }

  file { "/Users/${::luser}/.vimrc":
    ensure => link,
    target => "${boxen::config::srcdir}/dotfiles/.vimrc",
  }

  file { "/Users/${::luser}/.zshrc":
    ensure => link,
    target => "${boxen::config::srcdir}/dotfiles/.zshrc",
  }

  file { "/Users/${::luser}/dotfiles":
    ensure => link,
    target => "${boxen::config::srcdir}/dotfiles",
  }
}