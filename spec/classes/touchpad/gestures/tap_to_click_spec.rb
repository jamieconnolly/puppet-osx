require 'spec_helper'

describe 'osx::touchpad::gestures::tap_to_click' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'defaults' do
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggle tap-to-click (part 1)').with({
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'Clicking',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Toggle tap-to-click (part 2)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.mouse.tapBehavior',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })

      should contain_boxen__osx_defaults('Toggle tap-to-click (part 3)').with({
        :domain => 'NSGlobalDomain',
        :host   => 'currentHost',
        :key    => 'com.apple.mouse.tapBehavior',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggle tap-to-click (part 1)').with({
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'Clicking',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Toggle tap-to-click (part 2)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.mouse.tapBehavior',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })

      should contain_boxen__osx_defaults('Toggle tap-to-click (part 3)').with({
        :domain => 'NSGlobalDomain',
        :host   => 'currentHost',
        :key    => 'com.apple.mouse.tapBehavior',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Toggle tap-to-click (part 1)').with({
        :domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
        :key    => 'Clicking',
        :type   => 'int',
        :value  => 0,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Toggle tap-to-click (part 2)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.mouse.tapBehavior',
        :type   => 'int',
        :value  => 0,
        :user   => facts[:boxen_user],
      })

      should contain_boxen__osx_defaults('Toggle tap-to-click (part 3)').with({
        :domain => 'NSGlobalDomain',
        :host   => 'currentHost',
        :key    => 'com.apple.mouse.tapBehavior',
        :type   => 'int',
        :value  => 0,
        :user   => facts[:boxen_user],
      })
    end
  end
end
