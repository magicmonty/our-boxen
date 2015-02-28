class people::magicmonty::applications {
  include steam
  include spotify
  include evernote
  include googledrive
  # include go
  include oh-my-zsh
  include tagr
  include cyberduck
  include iterm2::stable
  include iterm2::colors::solarized_dark
  # include kindle
  include inkscape
  include mailbox
  include skitch
  include calibre
  include sublime_text
  include beyond_compare
  include screenflow
  include wunderlist
  include rubymine
  
  # go::version { '1.2': }
  # go::version { '1.3': }
  # go::version { '1.4': }
  
  class { 'handbrake':
    version => '0.10.0'
  }

  class { 'intellij':
    edition => 'community',
    version => '14.0.3'
  }

  $homebrew_packages = [
    'aria2',
    'exiv2',
    'ext4fuse',
    # 'ghostscript',
    'mkvtoolnix'
  ]

  ## Declare all Homebrew packages at once
  package { $homebrew_packages: }
}
