# Public: Configure the displayed items on the Desktop

class osx::desktop::displayed_items(
  $internal_hard_drives = undef,
  $external_hard_drives = undef,
  $mounted_servers = undef,
  $removable_media = undef
) {
  include osx::finder

  if $internal_hard_drives != undef {
    validate_bool($internal_hard_drives)

    boxen::osx_defaults { 'Show internal drives on the Desktop':
      domain => 'com.apple.finder',
      key    => 'ShowHardDrivesOnDesktop',
      type   => 'bool',
      value  => $internal_hard_drives,
      user   => $::boxen_user,
      notify => Exec['killall Finder'];
    }
  }

  if $external_hard_drives != undef {
    validate_bool($external_hard_drives)

    boxen::osx_defaults { 'Show external drives on the Desktop':
      domain => 'com.apple.finder',
      key    => 'ShowExternalHardDrivesOnDesktop',
      type   => 'bool',
      value  => $external_hard_drives,
      user   => $::boxen_user,
      notify => Exec['killall Finder'];
    }
  }

  if $mounted_servers != undef {
    validate_bool($mounted_servers)

    boxen::osx_defaults { 'Show mounted servers on the Desktop':
      domain => 'com.apple.finder',
      key    => 'ShowMountedServersOnDesktop',
      type   => 'bool',
      value  => $mounted_servers,
      user   => $::boxen_user,
      notify => Exec['killall Finder'];
    }
  }

  if $removable_media != undef {
    validate_bool($removable_media)

    boxen::osx_defaults { 'Show mounted media on the Desktop':
      domain => 'com.apple.finder',
      key    => 'ShowRemovableMediaOnDesktop',
      type   => 'bool',
      value  => $removable_media,
      user   => $::boxen_user,
      notify => Exec['killall Finder'];
    }
  }
}
