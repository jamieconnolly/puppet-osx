# Public: Toggle the icon preview on the desktop

class osx::desktop::icon_preview($ensure = 'present') {
  include osx::finder

  validate_re($ensure, '^(present|absent)$', "osx::desktop::icon_preview([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  plist_entry { 'DesktopViewSettings:IconViewSettings:showIconPreview':
    ensure => present,
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    value  => $enabled,
    notify => [
      Exec['killall Finder'],
      Exec['remove all .DS_Store files']
    ]
  }
}
