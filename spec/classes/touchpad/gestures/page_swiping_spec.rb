require 'spec_helper'

describe 'osx::touchpad::gestures::page_swiping' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'defaults' do
    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggle the ability to swipe to switch pages (mouse)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleEnableMouseSwipeNavigateWithScrolls',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Toggle the ability to swipe to switch pages (trackpad)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleEnableSwipeNavigateWithScrolls',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Toggle the ability to swipe to switch pages (mouse)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleEnableMouseSwipeNavigateWithScrolls',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Toggle the ability to swipe to switch pages (trackpad)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleEnableSwipeNavigateWithScrolls',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Toggle the ability to swipe to switch pages (mouse)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleEnableMouseSwipeNavigateWithScrolls',
        :type   => 'int',
        :value  => 0,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Toggle the ability to swipe to switch pages (trackpad)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleEnableSwipeNavigateWithScrolls',
        :type   => 'int',
        :value  => 0,
        :user   => facts[:boxen_user],
      })
    end
  end
end
