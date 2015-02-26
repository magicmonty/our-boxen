class gems {
  package { 'sass-globbing':
    ensure   => latest,
    provider => 'gem',
  }

  package { 'compass':
    ensure   => latest,
    provider => 'gem',
  }
}
