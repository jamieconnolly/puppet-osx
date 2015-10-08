# Public: Dim the dock icons for apps that are hidden

class osx::dock::hidden_app_dimming($ensure = 'present') {
  include osx::dock

  validate_re($ensure, '^(present|absent)$', "osx::dock::hidden_app_dimming([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Dim hidden apps':
    domain => 'com.apple.dock',
    key    => 'showhidden',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
