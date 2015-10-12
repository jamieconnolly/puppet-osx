require 'spec_helper'

describe 'osx::menu_bar::airplay' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::system::ui_server')
  end

  describe 'defaults' do
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether to show the AirPlay icon in the menu bar').with({
        :domain => 'com.apple.airplay',
        :key    => 'showInMenuBarIfPresent',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether to show the AirPlay icon in the menu bar').with({
        :domain => 'com.apple.airplay',
        :key    => 'showInMenuBarIfPresent',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle whether to show the AirPlay icon in the menu bar').with({
        :domain => 'com.apple.airplay',
        :key    => 'showInMenuBarIfPresent',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall SystemUIServer]',
      })
    end
  end
end
