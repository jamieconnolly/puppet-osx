require 'spec_helper'

describe 'osx::network::dsstores' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'defaults' do
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle the creation of .DS_Store on network volumes').with({
        :domain => 'com.apple.desktopservices',
        :key    => 'DSDontWriteNetworkStores',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle the creation of .DS_Store on network volumes').with({
        :domain => 'com.apple.desktopservices',
        :key    => 'DSDontWriteNetworkStores',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle the creation of .DS_Store on network volumes').with({
        :domain => 'com.apple.desktopservices',
        :key    => 'DSDontWriteNetworkStores',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
      })
    end
  end
end
