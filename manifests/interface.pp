# Public: Set the interface for the menu bar and Dock. Requires re-login.

class osx::interface($style = 'light') {
  validate_re($style, '^(dark|light)$', "osx::interface([style] must be 'light' or 'dark', is ${style}")

  $style_mode = capitalize($style)

  boxen::osx_defaults { 'Set the interface for the menu bar and Dock':
    domain => 'NSGlobalDomain',
    key    => 'AppleInterfaceStyle',
    type   => 'string',
    value  => $style_mode,
    user   => $::boxen_user;
  }
}
