# Public: Toggle whether to show the full URL in smart search field

class osx::safari::full_website_address($ensure = 'present') {
  validate_re($ensure, '^(present|absent)$', "osx::safari::full_website_address([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle whether to show the full website address':
    domain => 'com.apple.Safari',
    key    => 'ShowFullURLInSmartSearchField',
    type   => 'bool',
    value  => $enabled,
    user   => $::boxen_user;
  }
}
