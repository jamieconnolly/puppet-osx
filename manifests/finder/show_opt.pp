# Public: Toggle whether to show /opt in the Finder

class osx::finder::show_opt($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::finder::show_opt([ensure] must be present or absent, is ${ensure}")

  if $ensure == 'present' {
    exec { 'Show /opt in the Finder':
      command => 'chflags nohidden /opt',
      user    => 'root',
      onlyif  => 'ls -lOd /opt | grep hidden'
    }
  } else {
    exec { 'Hide /opt in the Finder':
      command => 'chflags hidden /opt',
      user    => 'root',
      onlyif  => 'ls -lOd /opt | grep -v hidden'
    }
  }
}
