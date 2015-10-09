# Public: Set the icon size on the desktop

class osx::desktop::icon_size($size = 32) {
  include osx::finder

  plist_entry { 'DesktopViewSettings:IconViewSettings:iconSize':
    ensure => present,
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    value  => $size,
    notify => [
      Exec['killall Finder'],
      Exec['remove all .DS_Store files']
    ]
  }
}
