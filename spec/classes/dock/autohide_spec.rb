require 'spec_helper'

describe 'osx::dock::autohide' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')
  end

  describe 'defaults' do
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether to automatically hide the Dock').with({
        :domain => 'com.apple.dock',
        :key    => 'autohide',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
      should_not contain_boxen__osx_defaults('Set the delay when auto-hiding the Dock')
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether to automatically hide the Dock').with({
        :domain => 'com.apple.dock',
        :key    => 'autohide',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
      should_not contain_boxen__osx_defaults('Set the delay when auto-hiding the Dock')
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle whether to automatically hide the Dock').with({
        :domain => 'com.apple.dock',
        :key    => 'autohide',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
      should_not contain_boxen__osx_defaults('Set the delay when auto-hiding the Dock')
    end
  end

  describe 'with delay set' do
    let(:params) { {:delay => 0} }

    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Set the delay when auto-hiding the Dock').with({
        :domain => 'com.apple.dock',
        :key    => 'autohide-delay',
        :type   => 'float',
        :value  => 0,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end
end
