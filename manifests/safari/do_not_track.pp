# Public: Toggle whether to send the Do Not Track (DNT) HTTP header in Safari

class osx::safari::do_not_track($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::safari::do_not_track([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle whether to send the "Do Not Track" HTTP header':
    domain => 'com.apple.Safari',
    key    => 'SendDoNotTrackHTTPHeader',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
