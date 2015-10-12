# Public: Sets the icon size for the Dock

class osx::dock::icon_size($size = 36) {
  include osx::dock

  boxen::osx_defaults { 'Set the icon size':
    domain => 'com.apple.dock',
    key    => 'tilesize',
    type   => 'int',
    value  => $size,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
