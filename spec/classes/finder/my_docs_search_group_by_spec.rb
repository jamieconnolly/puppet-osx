require 'spec_helper'

describe 'osx::finder::my_docs_search_group_by' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should include_class('osx::finder')
  end

  describe('defaults') do
    it 'should set the value to "None"' do
      should contain_plist_entry('MyDocsLibrarySearchViewSettings:GroupBy').with({
        :path   => "/Users/#{facts[:boxen_user]}/Library/Preferences/com.apple.finder.plist",
        :type   => 'string',
        :value  => 'None',
        :notify => 'Exec[killall Finder]',
      })
    end
  end

  describe('with grouping set') do
    let(:params) { {:grouping => 'date last opened'} }

    it 'should set the value to "Date Last Opened"' do
      should contain_plist_entry('MyDocsLibrarySearchViewSettings:GroupBy').with({
        :path   => "/Users/#{facts[:boxen_user]}/Library/Preferences/com.apple.finder.plist",
        :type   => 'string',
        :value  => 'Date Last Opened',
        :notify => 'Exec[killall Finder]',
      })
    end
  end
end
