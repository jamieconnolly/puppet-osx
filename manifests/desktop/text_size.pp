# Public: Set the text size on the desktop

class osx::desktop::text_size($size = 12) {
  include osx::finder

  plist_entry { 'DesktopViewSettings:IconViewSettings:textSize':
    ensure => present,
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    value  => $size,
    notify => [
      Exec['killall Finder'],
      Exec['remove all .DS_Store files']
    ]
  }
}
