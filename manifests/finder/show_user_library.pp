# Public: Toggle whether to show ~/Library in the Finder

class osx::finder::show_user_library($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::finder::show_user_library([ensure] must be present or absent, is ${ensure}")

  if $ensure == 'present' {
    exec { 'Show ~/Library in the Finder':
      command => "chflags nohidden /Users/${::boxen_user}/Library",
      onlyif  => "ls -lOd /Users/${::boxen_user}/Library | grep hidden"
    }
  } else {
    exec { 'Hide ~/Library in the Finder':
      command => "chflags hidden /Users/${::boxen_user}/Library",
      onlyif  => "ls -lOd /Users/${::boxen_user}/Library | grep -v hidden"
    }
  }
}
