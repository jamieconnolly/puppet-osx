# Public: Set the repeat rate for held keys

class osx::keyboard::key_repeat_rate($rate = 0) {
  boxen::osx_defaults { 'key repeat rate':
    domain => 'NSGlobalDomain',
    type   => 'int',
    key    => 'KeyRepeat',
    value  => $rate,
    user   => $::boxen_user;
  }
}
