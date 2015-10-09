# Public: Toggle the ability to swipe between pages

class osx::touchpad::gestures::page_swiping($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::touchpad::gestures::page_swiping([ensure] must be present or absent, is ${ensure}")

  $enabled_int = $ensure ? {
    present => 1,
    default => 0
  }

  boxen::osx_defaults {
    'toggle the ability to swipe to switch pages (mouse)':
      domain => 'NSGlobalDomain',
      key    => 'AppleEnableMouseSwipeNavigateWithScrolls',
      value  => $enabled_int,
      user   => $::boxen_user;

    'toggle the ability to swipe to switch pages (trackpad)':
      domain => 'NSGlobalDomain',
      key    => 'AppleEnableSwipeNavigateWithScrolls',
      value  => $enabled_int,
      user   => $::boxen_user;
  }
}
