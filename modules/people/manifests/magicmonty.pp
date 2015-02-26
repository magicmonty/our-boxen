class people::magicmonty (
  $my_username  = $people::magicmonty::params::my_username,
  $my_homedir   = $people::magicmonty::params::my_homedir,
  $my_sourcedir = $people::magicmonty::params::my_sourcedir,
) inherits people::magicmonty::params {

  ## declare all subclasses
  include people::magicmonty::applications
  include people::magicmonty::gitconfig
  include people::magicmonty::projects
}
