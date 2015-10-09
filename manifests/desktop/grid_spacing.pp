# Public: Set the grid spacing on the desktop

class osx::desktop::grid_spacing($spacing = 100) {
  include osx::finder

  plist_entry { 'DesktopViewSettings:IconViewSettings:gridSpacing':
    ensure => present,
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    value  => $spacing,
    notify => [
      Exec['killall Finder'],
      Exec['remove all .DS_Store files']
    ]
  }
}
