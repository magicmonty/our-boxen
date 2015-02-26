class people::kghh {
  include oh-my-zsh
  include cyberduck
  include chrome
  include onepassword::chrome

  class { 'thunderbird':
    locale => 'de',
  }
    

  git::config::global { 
    'user.name': value => 'Katharina Gondermann';
    'user.email': value => 'kg_hh@pagansoft.de';
  }

  $home = "/Users/${::luser}"
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"
  $my = "${home}/Development"

  # My dotfile repository
  repository { $dotfiles_dir:
    source => 'kghh/dotfiles'
  }

  file { "$home/.zshrc":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles_dir}/.zshrc",
    require => Repository[$dotfiles_dir],
  }

  file { "$home/.vimrc":
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles_dir}/.vimrc",
    require => Repository[$dotfiles_dir],
  }
}
