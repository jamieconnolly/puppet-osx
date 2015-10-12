# Public: Clear the dock of 'pinned' icons

class osx::dock::clear {
  include osx::dock

  boxen::osx_defaults {
    'Prevent Launchpad from reappearing':
      domain => 'com.apple.dock',
      key    => 'checked-for-launchpad',
      type   => 'bool',
      value  => true,
      user   => $::boxen_user,
      notify => Exec['killall Dock'];

    'Remove all the pinned apps':
      domain => 'com.apple.dock',
      key    => 'persistent-apps',
      type   => 'array',
      value  => '()',
      user   => $::boxen_user,
      notify => Exec['killall Dock'];

    'Remove all the pinned stacks':
      domain => 'com.apple.dock',
      key    => 'persistent-others',
      type   => 'array',
      value  => '()',
      user   => $::boxen_user,
      notify => Exec['killall Dock'];
  }
}
