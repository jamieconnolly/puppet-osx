# Public: Toggle whether to show the Finder path bar

class osx::finder::path_bar($ensure = 'present') {
  include osx::finder

  validate_re($ensure, '^(present|absent)$', "osx::finder::path_bar([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle whether to show the Finder path bar':
    domain => 'com.apple.finder',
    key    => 'ShowPathBar',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Finder']
  }
}
