# Public: Disables spelling autocorrect

class osx::keyboard::autocorrect($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::keyboard::autocorrect([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle autocorrect':
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticSpellingCorrectionEnabled',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
