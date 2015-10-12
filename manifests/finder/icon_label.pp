# Public: Set the position and text size of the labels in the Finder

class osx::finder::icon_label($position = undef, $size = undef) {
  include osx::finder

  if $position != undef {
    validate_re($position, '^(bottom|right)$', "osx::finder::icon_label([position] must be bottom or right, is ${position}")

    $position_mode = $position ? {
      'right' => false,
      default => true
    }

    plist_entry { [
      'DesktopViewSettings:IconViewSettings:labelOnBottom',
      'FK_StandardViewSettings:IconViewSettings:labelOnBottom',
      'StandardViewSettings:IconViewSettings:labelOnBottom'
    ]:
      path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
      type   => 'bool',
      value  => $position_mode,
      notify => Exec['killall Finder']
    }
  }

  if $size != undef {
    plist_entry { [
      'DesktopViewSettings:IconViewSettings:textSize',
      'FK_StandardViewSettings:IconViewSettings:textSize',
      'StandardViewSettings:IconViewSettings:textSize'
    ]:
      path   => "/Users/${::boxen_user}/Library/Preferences/com.apple.finder.plist",
      type   => 'int',
      value  => $size,
      notify => [
        Exec['killall Finder'],
        Exec['Remove all .DS_Store files']
      ]
    }
  }
}
