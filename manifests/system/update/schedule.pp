# Public: Set the interval between software update checks

class osx::system::update::schedule($frequency = 'weekly') {
  validate_re($frequency, '^(daily|weekly)$', "osx::system::update::schedule([ensure] must be daily; is ${frequency}")

  $frequency_int = $frequency ? {
    'daily'  => 1,
    'weekly' => 7,
    default  => 1
  }

  boxen::osx_defaults { 'Set the interval between software update checks':
    domain => '/Library/Preferences/com.apple.SoftwareUpdate',
    key    => 'ScheduleFrequency',
    type   => 'int',
    value  => $frequency_int,
    user   => 'root';
  }
}
