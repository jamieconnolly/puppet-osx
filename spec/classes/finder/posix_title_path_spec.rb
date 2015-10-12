require 'spec_helper'

describe 'osx::finder::posix_title_path' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::finder')
  end

  describe 'defaults' do
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether to show the full POSIX file path in the Finder title bar').with({
        :domain => 'com.apple.finder',
        :key    => '_FXShowPosixPathInTitle',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether to show the full POSIX file path in the Finder title bar').with({
        :domain => 'com.apple.finder',
        :key    => '_FXShowPosixPathInTitle',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle whether to show the full POSIX file path in the Finder title bar').with({
        :domain => 'com.apple.finder',
        :key    => '_FXShowPosixPathInTitle',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end
end
