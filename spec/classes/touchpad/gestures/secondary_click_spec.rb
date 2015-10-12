require 'spec_helper'

describe 'osx::touchpad::gestures::secondary_click' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'defaults' do
    it 'should set the value to "TwoButton"' do
      should contain_boxen__osx_defaults('Toggle secondary "right" click (mouse)').with({
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
        :key    => 'MouseButtonMode',
        :type   => 'string',
        :value  => 'TwoButton',
        :user   => facts[:boxen_user],
      })
    end

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle secondary "right" click (internal touchpad)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.enableSecondaryClick',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Toggle secondary "right" click (external touchpad)').with({
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'TrackpadRightClick',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to "TwoButton"' do
      should contain_boxen__osx_defaults('Toggle secondary "right" click (mouse)').with({
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
        :key    => 'MouseButtonMode',
        :type   => 'string',
        :value  => 'TwoButton',
        :user   => facts[:boxen_user],
      })
    end

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle secondary "right" click (internal touchpad)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.enableSecondaryClick',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Toggle secondary "right" click (external touchpad)').with({
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'TrackpadRightClick',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to "OneButton"' do
      should contain_boxen__osx_defaults('Toggle secondary "right" click (mouse)').with({
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
        :key    => 'MouseButtonMode',
        :type   => 'string',
        :value  => 'OneButton',
        :user   => facts[:boxen_user],
      })
    end

    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle secondary "right" click (internal touchpad)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.trackpad.enableSecondaryClick',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Toggle secondary "right" click (external touchpad)').with({
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'TrackpadRightClick',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
      })
    end
  end
end
