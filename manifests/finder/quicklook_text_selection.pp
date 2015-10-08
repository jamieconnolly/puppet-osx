# Public: Enables text selection on Quick Look preview windows

class osx::finder::quicklook_text_selection($ensure = 'present') {
  include osx::finder

  validate_re($ensure, '^(present|absent)$', "osx::finder::quicklook_text_selection([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle whether you can select text in Quick Look windows':
    domain => 'com.apple.finder',
    key    => 'QLEnableTextSelection',
    value  => $enabled,
    user   => $::boxen_user,
    notify => Exec['killall Finder'];
  }
}
