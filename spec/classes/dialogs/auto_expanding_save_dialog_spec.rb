require 'spec_helper'

describe 'osx::dialogs::auto_expanding_save_dialog' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set value to true' do
      should contain_boxen__osx_defaults('Expand save panel by default').with({
        :domain => 'NSGlobalDomain',
        :key    => 'NSNavPanelExpandedStateForSaveMode',
        :value  => true,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set value to false' do
      should contain_boxen__osx_defaults('Expand save panel by default').with({
        :domain => 'NSGlobalDomain',
        :key    => 'NSNavPanelExpandedStateForSaveMode',
        :value  => false,
        :user   => facts[:boxen_user],
      })
    end
  end
end
