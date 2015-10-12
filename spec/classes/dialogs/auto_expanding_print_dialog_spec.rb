require 'spec_helper'

describe 'osx::dialogs::auto_expanding_print_dialog' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set value to true' do
      should contain_boxen__osx_defaults('Expand print panel by default (part 1)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'PMPrintingExpandedStateForPrint',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Expand print panel by default (part 2)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'PMPrintingExpandedStateForPrint2',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set value to false' do
      should contain_boxen__osx_defaults('Expand print panel by default (part 1)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'PMPrintingExpandedStateForPrint',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
      })
      should contain_boxen__osx_defaults('Expand print panel by default (part 2)').with({
        :domain => 'NSGlobalDomain',
        :key    => 'PMPrintingExpandedStateForPrint2',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
      })
    end
  end

end
