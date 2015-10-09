# Public: Toggle tap-to-click

class osx::touchpad::gestures::tap_to_click($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::touchpad::gestures::tap_to_click([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults { 'toggle tap-to-click (bluetooth)':
    ensure => present,
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'Clicking',
    type   => 'int',
    value  => $enabled_int,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'toggle tap-to-click (mouse)':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.mouse.tapBehavior',
    type   => 'int',
    value  => $enabled_int,
    user   => $::boxen_user;
  }

  boxen::osx_defaults { 'toggle tap-to-click (current host)':
    ensure => present,
    domain => 'NSGlobalDomain',
    host   => 'currentHost',
    key    => 'com.apple.mouse.tapBehavior',
    type   => 'int',
    value  => $enabled_int,
    user   => $::boxen_user;
  }
}
