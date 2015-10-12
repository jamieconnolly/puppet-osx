# Public: Toggle whether software updates are downloaded in the background

class osx::system::update::automatic_downloads($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::system::update::automatic_downloads([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle whether software updates are downloaded in the background':
    domain => 'AutomaticDownload',
    key    => '/Library/Preferences/com.apple.SoftwareUpdate',
    type   => 'bool',
    value  => $enabled,
    user   => 'root';
  }
}
