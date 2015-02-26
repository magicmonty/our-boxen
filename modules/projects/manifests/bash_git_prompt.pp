class projects::bash_git_prompt {
  boxen::project { 'bash_git_prompt':
    source => 'magicmonty/bash-git-prompt'
  }
  
  file { "/Users/${::luser}/Development/bash-git-prompt":
    ensure => link,
    target => "${boxen::config::srcdir}/bash-git-prompt",
  }
}