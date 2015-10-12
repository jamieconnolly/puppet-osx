require 'spec_helper'

describe 'osx::dock::only_show_running_apps' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')
  end

  describe 'defaults' do
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether to only show running apps in the Dock').with({
        :domain => 'com.apple.dock',
        :key    => 'static-only',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether to only show running apps in the Dock').with({
        :domain => 'com.apple.dock',
        :key    => 'static-only',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle whether to only show running apps in the Dock').with({
        :domain => 'com.apple.dock',
        :key    => 'static-only',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end
end
