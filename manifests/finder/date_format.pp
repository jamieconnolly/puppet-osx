# Public: Toggle the use of relative or absolute dates
#
# Parameters
#
#   format =>
#     The date format to use
#

class osx::finder::date_format($format = 'relative') {
  include osx::finder

  validate_re($format, '^(relative|absolute)$', "osx::finder::date_format([ensure] must be 'relative' or 'absolute', is ${format}")

  $format_bool = $format ? {
    'relative' => true,
    default => false
  }

  plist_entry { [
    'FK_StandardViewSettings:ListViewSettings:useRelativeDates',
    'FK_StandardViewSettings:ExtendedListViewSettings:useRelativeDates',
    'StandardViewSettings:ListViewSettings:useRelativeDates',
    'StandardViewSettings:ExtendedListViewSettings:useRelativeDates'
  ]:
    ensure => present,
    path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
    type   => 'bool',
    value  => $format_bool,
    notify => Exec['killall Finder']
  }
}
