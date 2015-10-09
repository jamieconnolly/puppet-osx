# Public: Set the delay before held keys repeat

class osx::keyboard::key_repeat_delay($delay = 10) {
  boxen::osx_defaults { 'key repeat delay':
    domain => 'NSGlobalDomain',
    type   => 'int',
    key    => 'InitialKeyRepeat',
    value  => $delay,
    user   => $::boxen_user;
  }
}
