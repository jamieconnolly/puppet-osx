# Public: Configure what happens when the trash is emptied

class osx::trash::when_emptying($secure = undef, $warn = undef) {
  include osx::finder

  if $secure != undef {
    validate_bool($secure)

    boxen::osx_defaults { 'Toggle whether to securely empty the trash':
      domain => 'com.apple.finder',
      key    => 'EmptyTrashSecurely',
      value  => $secure,
      user   => $::boxen_user,
      notify => Exec['killall Finder'];
    }
  }

  if $warn != undef {
    validate_bool($warn)

    boxen::osx_defaults { 'Toggle the warning when emptying the trash':
      domain => 'com.apple.finder',
      key    => 'WarnOnEmptyTrash',
      value  => $warn,
      user   => $::boxen_user,
      notify => Exec['killall Finder'];
    }
  }
}
