# Public: Minimize windows into application icon

class osx::dock::minimize_to_application($ensure = 'present') {
  include osx::dock

  validate_re($ensure, '^(present|absent)$', "osx::dock::minimize_to_application([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle whether to minimize windows into application icon':
    domain => 'com.apple.dock',
    key    => 'minimize-to-application',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
