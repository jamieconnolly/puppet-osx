# Public: Toggle the dots that indicate a running application

class osx::dock::indicator_lights($ensure = 'present') {
  include osx::dock

  validate_re($ensure, '^(present|absent)$', "osx::dock::indicator_lights([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle indicator lights under running applications':
    domain => 'com.apple.dock',
    key    => 'show-process-indicators',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
