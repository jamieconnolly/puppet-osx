# Public: Set the group by used when displaying "All My Files"

class osx::my_docs::group_by($grouping = 'none') {
  include osx::finder

  validate_re($grouping, ['none', 'name', 'application', 'kind', 'size', 'finder tags', 'date added', 'date created', 'date last opened', 'date modified'])

  $groupBy = $grouping ? {
    'date added'       => 'Date Added',
    'date created'     => 'Date Created',
    'date last opened' => 'Date Last Opened',
    'date modified'    => 'Date Modified',
    'finder tags'      => 'Finder Tags',
    default            => capitalize($grouping)
  }

  plist_entry { 'MyDocsLibrarySearchViewSettings:GroupBy':
    ensure => present,
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    type   => 'string',
    value  => $groupBy,
    notify => [
      Exec['killall Finder'],
      Exec['remove all .DS_Store files']
    ]
  }
}
