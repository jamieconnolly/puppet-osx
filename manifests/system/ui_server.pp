# Private: Restart the SystemUIServer when necessary

class osx::system::ui_server {
  exec { 'killall SystemUIServer':
    refreshonly => true,
  }
}
