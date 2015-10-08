# Public: Define action for a hot corner
#
# Parameters
#
#   action =>
#     The action to trigger
#
#   corner =>
#     The position of the hot corner
#
#   modifier =>
#     The modifier key
#

define osx::dock::hot_corner(
  $corner = $name,
  $action = 'do nothing',
  $modifier = 'none'
) {
  include osx::dock

  validate_re($action, [
    'do nothing', 'mission control', 'show application windows', 'desktop', 'start screensaver',
    'disable screensaver', 'dashboard', 'sleep display', 'launchpad', 'notification center'
  ])
  validate_re($corner, ['bottom left', 'bottom right', 'top left', 'top right'])
  validate_re($modifier, ['command', 'control', 'none', 'option', 'shift'])

  $action_int = $action ? {
    'do nothing'               => 0,
    'mission control'          => 2,
    'show application windows' => 3,
    'desktop'                  => 4,
    'start screensaver'        => 5,
    'disable screensaver'      => 6,
    'dashboard'                => 7,
    'sleep display'            => 10,
    'launchpad'                => 11,
    'notification center'      => 12
  }

  $corner_abbrev = $corner ? {
    'bottom left'  => 'bl',
    'bottom right' => 'br',
    'top right'    => 'tr',
    'top left'     => 'tl'
  }

  $modifier_int = $modifier ? {
    'command' => 1048576,
    'control' => 262144,
    'none'    => 0,
    'option'  => 524288,
    'shift'   => 131072,
  }

  boxen::osx_defaults { "Set the ${corner} hot corner to ${action}":
    domain => 'com.apple.dock',
    key    => "wvous-${corner_abbrev}-corner",
    type   => 'int',
    value  => $action_int,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }

  boxen::osx_defaults { "Set the modifier for the ${corner} hot corner to ${modifier}":
    domain => 'com.apple.dock',
    key    => "wvous-${corner_abbrev}-modifier",
    type   => 'int',
    value  => $modifier_int,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
