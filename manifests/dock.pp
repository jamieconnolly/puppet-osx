# Private: Restart the Dock when necessary.

class osx::dock {
  exec { 'killall Dock':
    refreshonly => true
  }
}
