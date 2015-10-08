# Public: Set the default location when opening a new window
#
# Parameters
#
#   location =>
#     The default location
#
#   path =>
#     The default path (if location is 'other')
#

class osx::finder::default_location($location = 'home', $path = undef) {
  validate_re($location, ['computer', 'volume', 'home', 'desktop', 'documents', 'all my files', 'other'])

  $location_code = $location ? {
    'computer'     => 'PfCm',
    'volume'       => 'PfVo',
    'home'         => 'PfHm',
    'desktop'      => 'PfDe',
    'documents'    => 'PfDo',
    'all my files' => 'PfDo',
    'other'        => 'PfLo',
    default        => 'PfHm'
  }

  boxen::osx_defaults { 'set the default location when opening a new window':
    domain => 'com.apple.finder',
    key    => 'NewWindowTarget',
    type   => 'string',
    value  => $location_code,
    user   => $::boxen_user
  }

  if $path != undef and $location == 'other' {
    validate_absolute_path($path)

    boxen::osx_defaults { 'set the default location path when opening a new window':
      domain => 'com.apple.finder',
      key    => 'NewWindowTargetPath',
      type   => 'string',
      value  => "file://${path}",
      user   => $::boxen_user
    }
  }
}
