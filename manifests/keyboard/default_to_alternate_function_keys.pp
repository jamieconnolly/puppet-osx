# Public: Set function keys to be standard function keys (instead of always sending Fn). Requires re-login

class osx::keyboard::default_to_alternate_function_keys($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::keyboard::default_to_alternate_function_keys([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle "alternate" function keys when holding "fn" key':
    domain => 'NSGlobalDomain',
    key    => 'com.apple.keyboard.fnState',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
