# Public: Toggle keyboard press-and-hold for accented character entry

class osx::keyboard::accented_press_and_hold($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::keyboard::accented_press_and_hold([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle press-and-hold for accented characters':
    domain => 'NSGlobalDomain',
    key    => 'ApplePressAndHoldEnabled',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
