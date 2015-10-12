# Public: Toggle the icon preview in the Finder

class osx::finder::icon_preview($ensure = 'present') {
  include osx::finder

  validate_re($ensure, '^(present|absent)$', "osx::finder::icon_preview([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  plist_entry { [
    'DesktopViewSettings:IconViewSettings:showIconPreview',
    'FK_StandardViewSettings:IconViewSettings:showIconPreview',
    'StandardViewSettings:IconViewSettings:showIconPreview'
  ]:
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    type   => 'bool',
    value  => $enabled,
    notify => [
      Exec['killall Finder'],
      Exec['Remove all .DS_Store files']
    ]
  }
}
