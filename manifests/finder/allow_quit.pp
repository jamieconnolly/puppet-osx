# Public: Toggle the ability to quit Finder

class osx::finder::allow_quit($ensure = 'present') {
  include osx::finder

  validate_re($ensure, '^(present|absent)$', "osx::finder::allow_quit([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle the ability to quit Finder':
    domain => 'com.apple.finder',
    key    => 'QuitMenuItem',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Finder'];
  }
}
