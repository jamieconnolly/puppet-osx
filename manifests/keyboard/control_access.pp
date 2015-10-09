# Public: Toggle keyboard access for dialog controls

class osx::keyboard::control_access($mode = 'basic') {
  validate_re($mode, '^(basic|all_controls|all_controls_including_dropdowns)$', "osx::keyboard::control_access([ensure] must be one of: basic, all_controls, all_controls_including_dropdowns; is ${mode}")

  $mode_int = $mode ? {
    'all_controls_including_dropdowns' => 3,
    'all_controls'                     => 2,
    default                            => 1,
  }

  boxen::osx_defaults { 'Set keyboard access for controls':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleKeyboardUIMode',
    type   => 'int',
    value  => $mode_int,
    user   => $::boxen_user;
  }
}
