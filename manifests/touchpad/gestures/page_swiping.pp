# Public: Toggle the ability to swipe between pages

class osx::touchpad::gestures::page_swiping($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::touchpad::gestures::page_swiping([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults {
    'Toggle the ability to swipe to switch pages (mouse)':
      domain => 'NSGlobalDomain',
      key    => 'AppleEnableMouseSwipeNavigateWithScrolls',
      type   => 'int',
      value  => $enabled_int,
      user   => $::boxen_user;

    'Toggle the ability to swipe to switch pages (trackpad)':
      domain => 'NSGlobalDomain',
      key    => 'AppleEnableSwipeNavigateWithScrolls',
      type   => 'int',
      value  => $enabled_int,
      user   => $::boxen_user;
  }
}
