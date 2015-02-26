class tagr {
  package { 'Tagr':
    ensure => installed,
    source => 'http://www.harald-schubert.net/data/Tagr.zip',
    provider => compressed_app,
  }
}
