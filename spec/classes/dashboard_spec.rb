require 'spec_helper'

describe 'osx::dashboard' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_exec('killall Dashboard').with({
      :refreshonly => true,
    })
  end

  describe 'defaults' do
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle whether dashboard is enabled').with({
        :domain => 'com.apple.dashboard',
        :key    => 'mcx-disabled',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dashboard]',
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle whether dashboard is enabled').with({
        :domain => 'com.apple.dashboard',
        :key    => 'mcx-disabled',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dashboard]',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether dashboard is enabled').with({
        :domain => 'com.apple.dashboard',
        :key    => 'mcx-disabled',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dashboard]',
      })
    end
  end
end
