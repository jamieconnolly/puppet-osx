require 'spec_helper'

describe 'osx::touchpad::gestures::smart_zoom' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'defaults' do
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggle smart zoom (mouse)').with({
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
        :key    => 'MouseOneFingerDoubleTapGesture',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Toggle smart zoom (trackpad)').with({
        :domain => 'NSGlobalDomain',
        :host   => 'currentHost',
        :key    => 'com.apple.trackpad.twoFingerDoubleTapGesture',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggle smart zoom (mouse)').with({
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
        :key    => 'MouseOneFingerDoubleTapGesture',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Toggle smart zoom (trackpad)').with({
        :domain => 'NSGlobalDomain',
        :host   => 'currentHost',
        :key    => 'com.apple.trackpad.twoFingerDoubleTapGesture',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Toggle smart zoom (mouse)').with({
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
        :key    => 'MouseOneFingerDoubleTapGesture',
        :type   => 'int',
        :value  => 0,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Toggle smart zoom (trackpad)').with({
        :domain => 'NSGlobalDomain',
        :host   => 'currentHost',
        :key    => 'com.apple.trackpad.twoFingerDoubleTapGesture',
        :type   => 'int',
        :value  => 0,
        :user   => facts[:boxen_user],
      })
    end
  end
end
