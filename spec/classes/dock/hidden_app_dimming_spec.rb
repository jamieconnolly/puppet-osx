require 'spec_helper'

describe 'osx::dock::hidden_app_dimming' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')
  end

  describe 'defaults' do
    it 'should set value to true' do
      should contain_boxen__osx_defaults('Dim hidden apps').with({
        :domain => 'com.apple.dock',
        :key    => 'showhidden',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set value to true' do
      should contain_boxen__osx_defaults('Dim hidden apps').with({
        :domain => 'com.apple.dock',
        :key    => 'showhidden',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set value to false' do
      should contain_boxen__osx_defaults('Dim hidden apps').with({
        :domain => 'com.apple.dock',
        :key    => 'showhidden',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end
end
