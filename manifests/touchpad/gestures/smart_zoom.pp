# Public: Toggle smart zoom

class osx::touchpad::gestures::smart_zoom($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::mouse::gestures::smart_zoom([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults {
    'Toggle smart zoom (mouse)':
      domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
      key    => 'MouseOneFingerDoubleTapGesture',
      type   => 'int',
      value  => $enabled_int,
      user   => $::boxen_user;

    'Toggle smart zoom (trackpad)':
      domain => 'NSGlobalDomain',
      host   => 'currentHost',
      key    => 'com.apple.trackpad.twoFingerDoubleTapGesture',
      type   => 'int',
      value  => $enabled_int,
      user   => $::boxen_user;
  }
}
