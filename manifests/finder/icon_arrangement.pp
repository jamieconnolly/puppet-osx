# Public: Set the icon arrangement in the Finder

class osx::finder::icon_arrangement($style = 'grid') {
  include osx::finder

  validate_re($style, ['none', 'grid', 'name', 'kind', 'size', 'label', 'date added', 'date created', 'date last opened', 'date modified'])

  $_style = $style ? {
    'date added'       => 'dateAdded',
    'date created'     => 'dateCreated',
    'date last opened' => 'dateLastOpened',
    'date modified'    => 'dateModified',
    default            => $style
  }

  plist_entry { [
    'DesktopViewSettings:IconViewSettings:arrangeBy',
    'FK_StandardViewSettings:IconViewSettings:arrangeBy',
    'StandardViewSettings:IconViewSettings:arrangeBy'
  ]:
    ensure => present,
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    type   => 'string',
    value  => $_style,
    notify => [
      Exec['killall Finder'],
      Exec['remove all .DS_Store files']
    ]
  }
}
