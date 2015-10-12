# Public: Set the repeat rate for held keys

class osx::keyboard::key_repeat_rate($rate = 0) {
  boxen::osx_defaults { 'Set the key repeat rate':
    domain => 'NSGlobalDomain',
    key    => 'KeyRepeat',
    type   => 'int',
    value  => $rate,
    user   => $::boxen_user;
  }
}
