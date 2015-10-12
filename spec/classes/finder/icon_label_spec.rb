require 'spec_helper'

describe 'osx::finder::icon_label' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should include_class('osx::finder')

    should_not contain_plist_entry('DesktopViewSettings:IconViewSettings:labelOnBottom')
    should_not contain_plist_entry('FK_StandardViewSettings:IconViewSettings:labelOnBottom')
    should_not contain_plist_entry('StandardViewSettings:IconViewSettings:labelOnBottom')
    should_not contain_plist_entry('DesktopViewSettings:IconViewSettings:textSize')
    should_not contain_plist_entry('FK_StandardViewSettings:IconViewSettings:textSize')
    should_not contain_plist_entry('StandardViewSettings:IconViewSettings:textSize')
  end

  describe('with position set') do
    let(:params) { {:position => 'bottom'} }

    it 'should set the value to true' do
      params = {
        :path   => "/Users/#{facts[:boxen_user]}/Library/Preferences/com.apple.finder.plist",
        :type   => 'bool',
        :value  => true,
        :notify => 'Exec[killall Finder]',
      }

      should contain_plist_entry('DesktopViewSettings:IconViewSettings:labelOnBottom').with(params)
      should contain_plist_entry('FK_StandardViewSettings:IconViewSettings:labelOnBottom').with(params)
      should contain_plist_entry('StandardViewSettings:IconViewSettings:labelOnBottom').with(params)
    end
  end

  describe('with size set') do
    let(:params) { {:size => 10} }

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

      should contain_plist_entry('DesktopViewSettings:IconViewSettings:textSize').with(params)
      should contain_plist_entry('FK_StandardViewSettings:IconViewSettings:textSize').with(params)
      should contain_plist_entry('StandardViewSettings:IconViewSettings:textSize').with(params)
    end
  end
end
