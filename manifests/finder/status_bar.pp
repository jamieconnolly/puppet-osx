# Public: Toggle whether to show the Finder status bar

class osx::finder::status_bar($ensure = 'present') {
  include osx::finder

  validate_re($ensure, '^(present|absent)$', "osx::finder::status_bar([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle whether to show the Finder status bar':
    domain => 'com.apple.finder',
    key    => 'ShowStatusBar',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Finder']
  }
}
