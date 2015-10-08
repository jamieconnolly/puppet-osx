# Public: Toggle whether to show the full POSIX file path in the Finder title bar

class osx::finder::posix_title_path($ensure = 'present') {
  include osx::finder

  validate_re($ensure, '^(present|absent)$', "osx::finder::posix_title_path([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'toggle whether to show the full POSIX file path in the Finder title bar':
    domain => 'com.apple.finder',
    key    => '_FXShowPosixPathInTitle',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Finder']
  }
}
