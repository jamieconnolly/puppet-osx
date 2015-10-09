# Public: Toggle whether to expand the print panel dialog

class osx::dialogs::auto_expanding_print_dialog($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::dialogs::auto_expanding_print_dialog[ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults {
    'Expand print panel by default':
      ensure => present,
      domain => 'NSGlobalDomain',
      key    => 'PMPrintingExpandedStateForPrint',
      value  => $enabled,
      user   => $::boxen_user;

    'Expand print panel by default (part 2)':
      ensure => present,
      domain => 'NSGlobalDomain',
      key    => 'PMPrintingExpandedStateForPrint2',
      value  => $enabled,
      user   => $::boxen_user;
  }
}
