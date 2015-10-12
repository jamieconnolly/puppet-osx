require 'spec_helper'

describe 'osx::system::update::automatic_downloads' do
  describe 'defaults' do
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether software updates are downloaded in the background').with({
        :domain => 'AutomaticDownload',
        :key    => '/Library/Preferences/com.apple.SoftwareUpdate',
        :type   => 'bool',
        :value  => true,
        :user   => 'root',
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether software updates are downloaded in the background').with({
        :domain => 'AutomaticDownload',
        :key    => '/Library/Preferences/com.apple.SoftwareUpdate',
        :type   => 'bool',
        :value  => true,
        :user   => 'root',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle whether software updates are downloaded in the background').with({
        :domain => 'AutomaticDownload',
        :key    => '/Library/Preferences/com.apple.SoftwareUpdate',
        :type   => 'bool',
        :value  => false,
        :user   => 'root',
      })
    end
  end
end
