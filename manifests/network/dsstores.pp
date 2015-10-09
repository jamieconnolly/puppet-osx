# Public: Toggle the creation of .DS_Store files on network drives

class osx::network::dsstores($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::network::dsstores([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => false,
    default => true
  }

  boxen::osx_defaults { 'toggle the creation of .DS_Store on network volumes':
    domain => 'com.apple.desktopservices',
    key    => 'DSDontWriteNetworkStores',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
