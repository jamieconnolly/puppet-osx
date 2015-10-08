# Public: Automatically hide the dock
#
# Parameters
#
#   delay =>
#     The delay when auto-hiding the dock
#

class osx::dock::autohide($ensure = 'present', $delay = undef) {
  include osx::dock

  validate_re($ensure, '^(present|absent)$', "osx::dock::autohide([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Automatically hide the dock':
    domain => 'com.apple.dock',
    key    => 'autohide',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }

  if $delay != undef {
    boxen::osx_defaults { 'Set the delay when auto-hiding the dock':
      domain => 'com.apple.dock',
      key    => 'autohide-delay',
      type   => 'float',
      value  => $delay,
      user   => $::boxen_user,
      notify => Exec['killall Dock'];
    }
  }
}
