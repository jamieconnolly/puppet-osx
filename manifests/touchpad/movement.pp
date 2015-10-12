# Public: Set the scrolling and tracking speed for the trackpad

class osx::touchpad::movement($scrolling = undef, $tracking = undef) {
  if $scrolling != undef {
    boxen::osx_defaults { 'Set the speed with which the trackpad scrolls content':
      domain => 'NSGlobalDomain',
      key    => 'com.apple.trackpad.scrolling',
      type   => 'float',
      value  => $scrolling,
      user   => $::boxen_user;
    }
  }

  if $tracking != undef {
    boxen::osx_defaults { 'Set the speed with which the trackpad moves the cursor':
      domain => 'NSGlobalDomain',
      key    => 'com.apple.trackpad.scaling',
      type   => 'float',
      value  => $tracking,
      user   => $::boxen_user;
    }
  }
}
