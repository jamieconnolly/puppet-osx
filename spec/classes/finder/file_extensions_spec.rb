require 'spec_helper'

describe 'osx::finder::file_extensions' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should include_class('osx::finder')

    should_not contain_boxen__osx_defaults('Toggle whether to show all the filename extensions')
    should_not contain_boxen__osx_defaults('Toggle the warning before changing an extension')
  end

  describe('with display_all set') do
    let(:params) { {:display_all => true} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether to show all the filename extensions').with({
        :domain => 'NSGlobalDomain',
        :key    => 'AppleShowAllExtensions',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

  describe('with warn_on_change set') do
    let(:params) { {:warn_on_change => true} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle the warning before changing an extension').with({
        :domain => 'com.apple.finder',
        :key    => 'FXEnableExtensionChangeWarning',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end
end
