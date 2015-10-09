# Public: Toggle developer mode in Safari

class osx::safari::developer_mode($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::safari::developer_mode([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'toggle develop menu':
    ensure => present,
    domain => 'com.apple.Safari',
    key    => 'IncludeDevelopMenu',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
