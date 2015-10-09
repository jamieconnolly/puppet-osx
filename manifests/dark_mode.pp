# Public: Toggle the dark menu bar and dock. Requires re-login

class osx::dark_mode($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::dark_mode([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => false,
    default => true
  }

  boxen::osx_defaults { 'Toggle the dark menu bar and dock':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleInterfaceStyle',
    type   => 'string',
    value  => 'Dark',
    user   => $::boxen_user;
  }
}
