require 'spec_helper'

describe 'osx::finder::icon_arrangement' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should include_class('osx::finder')
  end

  describe('defaults') do
    it 'should set the value to "grid"' do
      params = {
        :path   => "/Users/#{facts[:boxen_user]}/Library/Preferences/com.apple.finder.plist",
        :type   => 'string',
        :value  => 'grid',
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove all .DS_Store files]',
        ],
      }

      should contain_plist_entry('DesktopViewSettings:IconViewSettings:arrangeBy').with(params)
      should contain_plist_entry('FK_StandardViewSettings:IconViewSettings:arrangeBy').with(params)
      should contain_plist_entry('StandardViewSettings:IconViewSettings:arrangeBy').with(params)
    end
  end

  describe('with style set') do
    let(:params) { {:style => 'date last opened'} }

    it 'should set the value to 10' do
      params = {
        :path   => "/Users/#{facts[:boxen_user]}/Library/Preferences/com.apple.finder.plist",
        :type   => 'string',
        :value  => 'dateLastOpened',
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove all .DS_Store files]',
        ],
      }

      should contain_plist_entry('DesktopViewSettings:IconViewSettings:arrangeBy').with(params)
      should contain_plist_entry('FK_StandardViewSettings:IconViewSettings:arrangeBy').with(params)
      should contain_plist_entry('StandardViewSettings:IconViewSettings:arrangeBy').with(params)
    end
  end
end
