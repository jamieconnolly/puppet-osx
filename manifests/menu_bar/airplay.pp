# Public: Toggle whether to show the AirPlay icon in the menu bar

class osx::menu_bar::airplay($ensure = 'present') {
  include osx::system::ui_server

  validate_re($ensure, '^(present|absent)$', "osx::menu_bar::airplay([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle whether to show the AirPlay icon in the menu bar':
    domain => 'com.apple.airplay',
    key    => 'showInMenuBarIfPresent',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall SystemUIServer'];
  }
}
