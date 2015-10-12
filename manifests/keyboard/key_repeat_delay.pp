# Public: Set the delay before held keys repeat

class osx::keyboard::key_repeat_delay($delay = 35) {
  boxen::osx_defaults { 'Set the key repeat delay':
    domain => 'NSGlobalDomain',
    key    => 'InitialKeyRepeat',
    type   => 'int',
    value  => $delay,
    user   => $::boxen_user;
  }
}
