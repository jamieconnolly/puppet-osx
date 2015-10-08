# Public: Enable/disable the dashboard

class osx::dashboard($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::dashboard([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => false,
    default => true
  }

  boxen::osx_defaults { 'Toggle whether dashboard is enabled':
    domain => 'com.apple.dashboard',
    key    => 'mcx-disabled',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Dashboard'],
  }

  exec { 'killall Dashboard':
    refreshonly => true
  }
}
