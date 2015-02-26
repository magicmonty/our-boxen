class beyond_compare {
  package { 'Beyond Compare':
    ensure   => installed,
    source   => 'http://www.scootersoftware.com/BCompareOSX-4.0.5.19480.zip',
    provider => compressed_app,
    require  => Package['boxen/brews/git'],
  }
  
  file { '/usr/local/bin/bcomp':
    ensure  => link,
    target  => 'Applications/Beyond Compare.app/Contents/MacOS/bcomp'
  }  

  file { '/usr/local/bin/bcompare':
    ensure  => link,
    target  => 'Applications/Beyond Compare.app/Contents/MacOS/bcomp'
  }  
  
  git::config::global { 
    'merge.keepbackup': value => 'false',
    require => File['/usr/local/bin/bcomp'];

    'merge.tool': value => 'bc3',
    require => File['/usr/local/bin/bcomp'];

    'diff.tool': value => 'bc3',
    require => File['/usr/local/bin/bcomp'];

    'mergetool.bc3': value => 'trustExitCode',
    require => File['/usr/local/bin/bcomp'];

    'difftool.bc3': value => 'trustExitCode',
    require => File['/usr/local/bin/bcomp'];

    'mergetool.bc3.cmd': value => '/usr/local/bin/bcomp $LOCAL $REMOTE $BASE $MERGED',
    require => File['/usr/local/bin/bcomp'];
  }
}
