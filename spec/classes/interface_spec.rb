require 'spec_helper'

describe 'osx::interface' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'defaults' do
    it 'should set the value to "Light"' do
      should contain_boxen__osx_defaults('Set the interface for the menu bar and Dock').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleInterfaceStyle',
        :type   => 'string',
        :value  => 'Light',
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'with style set' do
    let(:params) { {:style => 'dark'} }

    it 'should set the value to "Dark"' do
      should contain_boxen__osx_defaults('Set the interface for the menu bar and Dock').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleInterfaceStyle',
        :type   => 'string',
        :value  => 'Dark',
        :user   => facts[:boxen_user],
      })
    end
  end
end
