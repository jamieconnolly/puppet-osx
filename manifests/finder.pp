# Private: Restart finder when necessary

class osx::finder {
  exec { 'killall Finder':
    refreshonly => true
  }

  exec { 'remove all .DS_Store files':
    command     => 'find / -xdev -name .DS_Store -delete',
    user        => root,
    refreshonly => true,
  }
}
