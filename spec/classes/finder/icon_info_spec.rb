require 'spec_helper'

describe 'osx::finder::icon_info' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::finder')
  end

  describe 'defaults' do
    it 'should set the value to true' do
      params = {
        :path   => "/Users/#{facts[:boxen_user]}/Library/Preferences/com.apple.finder.plist",
        :type   => 'bool',
        :value  => true,
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove all .DS_Store files]',
        ],
      }

      should contain_plist_entry('DesktopViewSettings:IconViewSettings:showItemInfo').with(params)
      should contain_plist_entry('FK_StandardViewSettings:IconViewSettings:showItemInfo').with(params)
      should contain_plist_entry('StandardViewSettings:IconViewSettings:showItemInfo').with(params)
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to true' do
      params = {
        :path   => "/Users/#{facts[:boxen_user]}/Library/Preferences/com.apple.finder.plist",
        :type   => 'bool',
        :value  => true,
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove all .DS_Store files]',
        ],
      }

      should contain_plist_entry('DesktopViewSettings:IconViewSettings:showItemInfo').with(params)
      should contain_plist_entry('FK_StandardViewSettings:IconViewSettings:showItemInfo').with(params)
      should contain_plist_entry('StandardViewSettings:IconViewSettings:showItemInfo').with(params)
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to true' do
      params = {
        :path   => "/Users/#{facts[:boxen_user]}/Library/Preferences/com.apple.finder.plist",
        :type   => 'bool',
        :value  => false,
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove all .DS_Store files]',
        ],
      }

      should contain_plist_entry('DesktopViewSettings:IconViewSettings:showItemInfo').with(params)
      should contain_plist_entry('FK_StandardViewSettings:IconViewSettings:showItemInfo').with(params)
      should contain_plist_entry('StandardViewSettings:IconViewSettings:showItemInfo').with(params)
    end
  end
end
