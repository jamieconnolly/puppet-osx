require 'spec_helper'

describe 'osx::system::recovery_message' do
  let(:title)       { 'If this Mac is found, please call 123-123-1234' }
  let(:kextdir)     { '/System/Library/Extensions' }
  let(:eficachedir) { '/System/Library/Caches/com.apple.corestorage/EFILoginLocalizations' }

  it do
    should contain_exec('Refresh system kext cache').with({
      :command     => "/usr/bin/touch #{kextdir}",
      :creates     => eficachedir,
      :refreshonly => true,
      :user        => 'root',
    })

    should contain_exec('Refresh CoreStorage EFI cache').with({
      :command     => "/usr/bin/touch #{eficachedir}",
      :onlyif      => "test -d #{eficachedir}",
      :refreshonly => true,
      :user        => 'root',
    })
  end

  describe 'defaults' do
    it do
      should contain_boxen__osx_defaults('Set OS X recovery message').with({
        :domain => '/Library/Preferences/com.apple.loginwindow.plist',
        :key    => 'LoginwindowText',
        :type   => 'string',
        :value  => title,
        :user   => 'root',
        :notify => [
          "Exec[Refresh system kext cache]",
          "Exec[Refresh CoreStorage EFI cache]",
        ],
      })

      should contain_exec('Set OS X recovery message NVRAM variable').with({
        :command => "nvram good-samaritan-message='#{title}'",
        :unless  => "nvram good-samaritan-message | cut -c24- | grep '^#{title}$'",
        :user    => 'root',
      })
    end
  end

  describe 'with value set' do
    let(:params) { {:value => 'foo'} }

    it do
      should contain_boxen__osx_defaults('Set OS X recovery message').with({
        :domain => '/Library/Preferences/com.apple.loginwindow.plist',
        :key    => 'LoginwindowText',
        :type   => 'string',
        :value  => 'foo',
        :user   => 'root',
        :notify => [
          "Exec[Refresh system kext cache]",
          "Exec[Refresh CoreStorage EFI cache]",
        ],
      })

      should contain_exec('Set OS X recovery message NVRAM variable').with({
        :command => "nvram good-samaritan-message='foo'",
        :unless  => "nvram good-samaritan-message | cut -c24- | grep '^foo$'",
        :user    => 'root',
      })
    end
  end

  describe 'with value set that includes an apostrophe' do
    let(:title) { "Jack's message with an apostrophe" }
    let(:error) { "Your osx::system::recovery_message declaration contains an apostrophe" }

    it do
      expect {
        should contain_exec('Set OS X recovery message NVRAM variable')
      }.to raise_error(Puppet::Error, /#{error}/)
    end
  end

  describe 'with ensure => absent' do
    let(:params) { {:ensure => 'absent'} }

    it do
      should contain_boxen__osx_defaults('Remove OS X recovery message').with({
        :ensure => 'absent',
        :domain => '/Library/Preferences/com.apple.loginwindow.plist',
        :key    => 'LoginwindowText',
        :user   => 'root',
        :notify => [
          "Exec[Refresh system kext cache]",
          "Exec[Refresh CoreStorage EFI cache]",
        ],
      })

      should contain_exec('Remove OS X recovery message NVRAM variable').with({
        :command => 'nvram -d good-samaritan-message',
        :onlyif  => 'nvram -p | grep good-samaritan-message',
        :user    => 'root',
      })
    end
  end
end
