# Public: Toggle the App Quarantine feature so you can run the apps you download

class osx::system::app_quarantine($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::system::app_quarantine([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'toggle the downloaded app quarantine':
    domain => 'com.apple.LaunchServices',
    key    => 'LSQuarantine',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
