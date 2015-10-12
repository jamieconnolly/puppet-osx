# Public: Toggle the secondary "right click"

class osx::touchpad::gestures::secondary_click($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::touchpad::gestures::secondary_click([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  $mouse_mode = $ensure ? {
    present => 'TwoButton',
    default => 'OneButton'
  }

  boxen::osx_defaults {
    'Toggle secondary "right" click (mouse)':
      domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
      key    => 'MouseButtonMode',
      type   => 'string',
      value  => $mouse_mode,
      user   => $::boxen_user;

    'Toggle secondary "right" click (internal touchpad)':
      domain => 'NSGlobalDomain',
      key    => 'com.apple.trackpad.enableSecondaryClick',
      type   => 'bool',
      value  => $enabled,
      user   => $::boxen_user;

    'Toggle secondary "right" click (external touchpad)':
      domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
      key    => 'TrackpadRightClick',
      type   => 'bool',
      value  => $enabled,
      user   => $::boxen_user;
  }
}
