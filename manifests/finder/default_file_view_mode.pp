# Public: Set the default file view mode
#
# Parameters
#
#   mode =>
#     Which style to use for the file view
#

class osx::finder::default_file_view_mode($mode = 'list') {
  include osx::finder

  validate_re($mode, '^(icons|list|columns|cover_flow)$', "osx::finder::default_file_view_mode([mode] must be oneof the following: icons, list, columns, cover_flow; is ${mode}")

  $mode_code = $mode ? {
    'icons'      => 'icnv',
    'list'       => 'Nlsv',
    'columns'    => 'clmv',
    'cover_flow' => 'Flwv',
    default      => 'Nlsv'
  }

  boxen::osx_defaults { 'set the default file view mode':
    domain => 'com.apple.finder',
    key    => 'FXPreferredViewStyle',
    type   => 'string',
    value  => $mode_code,
    user   => $::boxen_user,
    notify => [
      Exec['killall Finder'],
      Exec['remove all .DS_Store files']
    ]
  }
}
