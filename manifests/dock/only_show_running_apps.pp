# Public: Toggle whether to only show running apps in the Dock

class osx::dock::only_show_running_apps($ensure = 'present') {
  include osx::dock

  validate_re($ensure, '^(present|absent)$', "osx::dock::only_show_running_apps([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle whether to only show running apps in the Dock':
    domain => 'com.apple.dock',
    key    => 'static-only',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
