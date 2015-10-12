# Public: Set the icon size in the Finder

class osx::finder::icon_size($size = 32) {
  include osx::finder

  plist_entry { [
    'DesktopViewSettings:IconViewSettings:iconSize',
    'FK_StandardViewSettings:IconViewSettings:iconSize',
    'StandardViewSettings:IconViewSettings:iconSize'
  ]:
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    type   => 'int',
    value  => $size,
    notify => [
      Exec['killall Finder'],
      Exec['Remove all .DS_Store files']
    ]
  }
}
