# Public: Toggle whether to show the item info in the Finder

class osx::finder::icon_info($ensure = 'present') {
  include osx::finder

  validate_re($ensure, '^(present|absent)$', "osx::finder::icon_info([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  plist_entry { [
    'DesktopViewSettings:IconViewSettings:showItemInfo',
    'FK_StandardViewSettings:IconViewSettings:showItemInfo',
    'StandardViewSettings:IconViewSettings:showItemInfo'
  ]:
    ensure => present,
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    type   => 'bool',
    value  => $enabled,
    notify => [
      Exec['killall Finder'],
      Exec['remove all .DS_Store files']
    ]
  }
}
