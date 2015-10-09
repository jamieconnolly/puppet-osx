# Public: Set the position of the labels on the desktop

class osx::desktop::label_position($position = 'bottom') {
  include osx::finder

  validate_re($position, '^(bottom|right)$', "osx::desktop::label_position([position] must be bottom or right, is ${position}")

  $position_mode = $position ? {
    'right' => false,
    default => true
  }

  plist_entry { 'DesktopViewSettings:IconViewSettings:labelOnBottom':
    ensure => present,
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    value  => $position_mode,
    notify => Exec['killall Finder']
  }
}
