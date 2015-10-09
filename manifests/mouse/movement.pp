# Public: Set the scrolling and tracking speed for multitouch mice

class osx::mouse::movement($scrolling = undef, $tracking = undef) {
  if $scrolling != undef {
    boxen::osx_defaults { 'set the speed with which the mouse scrolls content':
      domain => 'NSGlobalDomain',
      key    => 'com.apple.scrollwheel.scaling',
      type   => 'float',
      value  => $scrolling,
      user   => $::boxen_user;
    }
  }

  if $tracking != undef {
    boxen::osx_defaults { 'set the speed with which mouse movement moves the cursor':
      domain => 'NSGlobalDomain',
      key    => 'com.apple.mouse.scaling',
      type   => 'float',
      value  => $tracking,
      user   => $::boxen_user;
    }
  }
}
