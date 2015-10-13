require 'spec_helper'

describe 'osx::finder::icon_spacing' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should include_class('osx::finder')
  end

  describe('defaults') do
    it 'should set the value to 100' do
      params = {
        :path   => "/Users/#{facts[:boxen_user]}/Library/Preferences/com.apple.finder.plist",
        :type   => 'int',
        :value  => 100,
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove all .DS_Store files]',
        ],
      }

      should contain_plist_entry('DesktopViewSettings:IconViewSettings:gridSpacing').with(params)
      should contain_plist_entry('FK_StandardViewSettings:IconViewSettings:gridSpacing').with(params)
      should contain_plist_entry('StandardViewSettings:IconViewSettings:gridSpacing').with(params)
    end
  end

  describe('with spacing set') do
    let(:params) { {:spacing => 10} }

    it 'should set the value to 10' do
      params = {
        :path   => "/Users/#{facts[:boxen_user]}/Library/Preferences/com.apple.finder.plist",
        :type   => 'int',
        :value  => 10,
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove all .DS_Store files]',
        ],
      }

      should contain_plist_entry('DesktopViewSettings:IconViewSettings:gridSpacing').with(params)
      should contain_plist_entry('FK_StandardViewSettings:IconViewSettings:gridSpacing').with(params)
      should contain_plist_entry('StandardViewSettings:IconViewSettings:gridSpacing').with(params)
    end
  end
end
