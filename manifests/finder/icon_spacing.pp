# Public: Set the icon spacing in the Finder

class osx::finder::icon_spacing($spacing = 100) {
  include osx::finder

  plist_entry { [
    'DesktopViewSettings:IconViewSettings:gridSpacing',
    'FK_StandardViewSettings:IconViewSettings:gridSpacing',
    'StandardViewSettings:IconViewSettings:gridSpacing'
  ]:
    ensure => present,
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    value  => $spacing,
    notify => [
      Exec['killall Finder'],
      Exec['remove all .DS_Store files']
    ]
  }
}
