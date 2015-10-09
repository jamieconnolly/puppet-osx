# Public: Set the default group by used when searching in Finder

class osx::finder::default_search_group_by($grouping = 'none') {
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

  boxen::osx_defaults { 'set the default grouping used when searching':
    domain => 'com.apple.finder',
    key    => 'FXPreferredGroupBy',
    type   => 'string',
    value  => $groupBy,
    user   => $::boxen_user,
    notify => Exec['killall Finder']
  }
}
