# Public: Disables spelling autocorrect

class osx::keyboard::autocorrect($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::keyboard::autocorrect([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle autocorrect':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticSpellingCorrectionEnabled',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
