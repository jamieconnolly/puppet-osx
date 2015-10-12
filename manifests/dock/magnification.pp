# Public: Set the dock icon magnification
#
# Parameters
#
#   magnified_icon_size =>
#     The size of the icon when magnified
#

class osx::dock::magnification($ensure = 'present', $magnified_icon_size = undef) {
  include osx::dock

  validate_re($ensure, '^(present|absent)$', "osx::dock::magnification([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle icon magnification':
    domain => 'com.apple.dock',
    key    => 'magnification',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }

  if $magnified_icon_size != undef {
    boxen::osx_defaults { 'Set the magnified icon size':
      domain => 'com.apple.dock',
      key    => 'largesize',
      type   => 'int',
      value  => $magnified_icon_size,
      user   => $::boxen_user,
      notify => Exec['killall Dock'];
    }
  }
}
