require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::homebrewdir}/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  #include hub
  #include nginx

  # fail if FDE is not enabled
  # if $::root_encrypted == 'no' {
  #  fail('Please enable full disk encryption and try again')
  # }

  # node versions
  #nodejs::version { 'v0.6': }
  #nodejs::version { 'v0.8': }
  nodejs::version { 'v0.10': }

  # default ruby versions
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }
  ruby::version { '2.1.4': }
  
  # own tools
  include brewcask
  include skype
  include vlc
  include alfred
  include gimp
  # include osxfuse
  include ntfs_3g
  include inkscape
  # include libreoffice
  include dropbox
  include chrome
  include zsh
  include crashplan
  #include mactex::full
  include appcleaner
  include virtualbox
  include macvim
  include spectacle
  include caffeine
  include sourcetree
  include onlinetvrecorder
  include skim
  include xmind
  
  class { 'firefox':
    locale => 'de',
  }
  
  # class { 'libreoffice::languagepack':
  #   locale => 'de'
  # }

  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => '*',
  }
  
  ruby::version { '2.1.2': }

  # OSX settings
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::enable_keyboard_control_access

  include osx::dock::dim_hidden_apps

  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::show_removable_media_on_desktop
  include osx::finder::unhide_library
  
  include osx::no_network_dsstores
  include osx::software_update

  osx::recovery_message { 'If this Mac is found, please call +49 (6151) 130 53 90': }
  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar',
      'mc'
    ]:
  }

  package {
    [
      'osxfuse'
    ]: provider => 'brewcask'
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
