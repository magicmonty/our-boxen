class people::magicmonty::gitconfig {
  git::config::global { 
    'user.name': value => 'Martin Gondermann';
    'user.email': value => 'magicmonty@pagansoft.de';
    'alias.st': value => 'status';
    'alias.ci': value => 'commit';
    'alias.br': value => 'branch';
    'alias.co': value => 'checkout';
    'alias.df': value => 'diff';
    'alias.lg': value => 'log -p';
    'alias.who': value => 'shortlog -s --';
    'alias.hist': value => "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
    'alias.type': value => 'cat-file -t';
    'alias.dump': value => 'cat-file -p';
    'push.default': value => 'current';
  }
}