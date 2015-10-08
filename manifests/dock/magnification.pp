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

  boxen::osx_defaults { 'toggle magnification':
    key    => 'magnification',
    domain => 'com.apple.dock',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }

  if $magnified_icon_size != undef {
    boxen::osx_defaults { 'set magnified icon size':
      key    => 'largesize',
      domain => 'com.apple.dock',
      type   => 'int',
      value  => $magnified_icon_size,
      user   => $::boxen_user,
      notify => Exec['killall Dock'];
    }
  }
}
