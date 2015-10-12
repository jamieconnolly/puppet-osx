# Public: Toggle whether to expand the save panel dialog

class osx::dialogs::auto_expanding_save_dialog($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::dialogs::auto_expanding_save_dialog[ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Expand save panel by default':
    domain => 'NSGlobalDomain',
    key    => 'NSNavPanelExpandedStateForSaveMode',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
