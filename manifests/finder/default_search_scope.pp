# Public: Set the default scope used when searching in Finder

class osx::finder::default_search_scope($scope = 'current folder') {
  include osx::finder

  validate_re($scope, ['current folder', 'previous scope', 'this mac'])

  $scope_code = $scope ? {
    'current folder' => 'SCcf',
    'previous scope' => 'SCsp',
    'this mac'       => 'SCev',
    default          => 'SCcf'
  }

  boxen::osx_defaults { 'Set the default scope used when searching':
    domain => 'com.apple.finder',
    key    => 'FXDefaultSearchScope',
    type   => 'string',
    value  => $scope_code,
    user   => $::boxen_user,
    notify => Exec['killall Finder']
  }
}
