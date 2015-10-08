# Public: Configure whether to show file extensions, and warn when changing them

class osx::finder::file_extensions($display_all = undef, $warn_on_change = undef) {
  include osx::finder

  if $display_all != undef {
    validate_bool($display_all)

    boxen::osx_defaults { 'Toggle whether to show all the filename extensions':
      domain => 'NSGlobalDomain',
      key    => 'AppleShowAllExtensions',
      value  => $display_all,
      user   => $::boxen_user,
      notify => Exec['killall Finder'];
    }
  }

  if $warn_on_change != undef {
    validate_bool($warn_on_change)

    boxen::osx_defaults { 'Toggle the warning before changing an extension':
      domain => 'com.apple.finder',
      key    => 'FXEnableExtensionChangeWarning',
      value  => $warn_on_change,
      user   => $::boxen_user,
      notify => Exec['killall Finder'];
    }
  }
}
