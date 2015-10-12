# Public: Set the style of the Dock
#
# Parameters
#
#   style =>
#     The style of the Dock ('2D' or '3D')
#

class osx::dock::style($style = '3D') {
  include osx::dock

  validate_re($style, '^(2D|3D)$', "osx::dock::style([style] must be 2D or 3D, is ${style}")

  $style_mode = $style ? {
    '3D'    => false,
    default => true
  }

  boxen::osx_defaults { 'Set the style of the Dock':
    domain => 'com.apple.dock',
    key    => 'no-glass',
    type   => 'bool',
    value  => $style_mode,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
