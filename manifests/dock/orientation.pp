# Public: Set the dock orientation
#
# Parameters
#
#   orientation =>
#     The orientation of the Dock ('top', 'right', 'bottom' or 'left')
#

class osx::dock::orientation($orientation = 'right') {
  include osx::dock

  validate_re($orientation, '^(top|right|bottom|left)$', "osx::dock::orientation([orientation] must be one of the following: top, right, bottom, left, is ${orientation}")

  boxen::osx_defaults { 'dock orientation':
    domain => 'com.apple.dock',
    key    => 'orientation',
    type   => 'string',
    value  => $orientation,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
