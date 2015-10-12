# Public: Toggle whether to use AirDrop over any interface

class osx::airdrop::all_interfaces($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::airdrop::all_interfaces[ensure] must be present or absent, is ${ensure}")

  $allow = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle whether to use AirDrop over any interface':
    domain => 'com.apple.NetworkBrowser',
    key    => 'BrowseAllInterfaces',
    type   => 'bool',
    value  => $allow,
    user   => $::boxen_user;
  }
}
