# Public: Set the arrangement for "All My Files"

class osx::my_files::arrangement($style = 'none') {
  include osx::finder

  validate_re($style, ['none', 'name', 'application', 'kind', 'size', 'finder tags', 'date added', 'date created', 'date last opened', 'date modified'])

  $_style = $style ? {
    'date added'       => 'Date Added',
    'date created'     => 'Date Created',
    'date last opened' => 'Date Last Opened',
    'date modified'    => 'Date Modified',
    'finder tags'      => 'Finder Tags',
    default            => capitalize($style)
  }

  plist_entry { 'MyDocsLibrarySearchViewSettings:GroupBy':
    ensure => present,
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    value  => $_style,
    notify => [
      Exec['killall Finder'],
      Exec['remove all .DS_Store files']
    ]
  }
}
