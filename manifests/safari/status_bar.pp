# Public: Toggle whether to show the Safari status bar

class osx::safari::status_bar($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::safari::status_bar([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle whether to show the status bar':
    domain => 'com.apple.Safari',
    key    => 'ShowStatusBar',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
