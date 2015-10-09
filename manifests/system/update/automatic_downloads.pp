# Public: Toggle whether software updates are downloaded in the background

class osx::system::update::automatic_downloads($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::system::update::automatic_downloads([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'toggle whether software updates are downloaded in the background when available':
    domain => 'AutomaticDownload',
    key    => '/Library/Preferences/com.apple.SoftwareUpdate',
    value  => $enabled,
    user   => 'root';
  }
}
