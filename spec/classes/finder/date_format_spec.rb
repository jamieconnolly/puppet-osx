require 'spec_helper'

describe 'osx::finder::date_format' do
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
        :notify => 'Exec[killall Finder]',
      }

      should contain_plist_entry('FK_StandardViewSettings:ListViewSettings:useRelativeDates').with(params)
      should contain_plist_entry('FK_StandardViewSettings:ExtendedListViewSettings:useRelativeDates').with(params)
      should contain_plist_entry('StandardViewSettings:ListViewSettings:useRelativeDates').with(params)
      should contain_plist_entry('StandardViewSettings:ExtendedListViewSettings:useRelativeDates').with(params)
    end
  end

  describe 'with format set' do
    let(:params) { {:format => 'absolute'} }

    it 'should set the value to false' do
      params = {
        :path   => "/Users/#{facts[:boxen_user]}/Library/Preferences/com.apple.finder.plist",
        :type   => 'bool',
        :value  => false,
        :notify => 'Exec[killall Finder]',
      }

      should contain_plist_entry('FK_StandardViewSettings:ListViewSettings:useRelativeDates').with(params)
      should contain_plist_entry('FK_StandardViewSettings:ExtendedListViewSettings:useRelativeDates').with(params)
      should contain_plist_entry('StandardViewSettings:ListViewSettings:useRelativeDates').with(params)
      should contain_plist_entry('StandardViewSettings:ExtendedListViewSettings:useRelativeDates').with(params)
    end
  end
end
