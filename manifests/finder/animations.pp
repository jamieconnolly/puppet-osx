# Public: Toggle Finder animations

class osx::finder::animations($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::finder::animations([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => false,
    default => true
  }

  boxen::osx_defaults { 'Toggle Finder animations':
    domain => 'com.apple.finder',
    key    => 'DisableAllAnimations',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user
  }
}
