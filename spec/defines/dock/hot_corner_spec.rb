require 'spec_helper'

describe 'osx::dock::hot_corner' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'defaults' do
    let(:title) { 'bottom left' }

    it do
      should include_class('osx::dock')

      should contain_boxen__osx_defaults('Set the bottom left hot corner to do nothing').with({
        :domain => 'com.apple.dock',
        :key    => "wvous-bl-corner",
        :type   => 'int',
        :value  => 0,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })

      should contain_boxen__osx_defaults('Set the modifier for the bottom left hot corner to none').with({
        :domain => 'com.apple.dock',
        :key    => "wvous-bl-modifier",
        :type   => 'int',
        :value  => 0,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end

  describe 'with corner set' do
    {
      'bottom left'  => 'bl',
      'bottom right' => 'br',
      'top right'    => 'tr',
      'top left'     => 'tl'
    }.each_pair do |corner, corner_abbrev|
      describe "as #{corner}" do
        let(:title) { 'active corner' }

        {
          'do nothing'               => 0,
          'mission control'          => 2,
          'show application windows' => 3,
          'desktop'                  => 4,
          'start screensaver'        => 5,
          'disable screensaver'      => 6,
          'dashboard'                => 7,
          'sleep display'            => 10,
          'launchpad'                => 11,
          'notification center'      => 12,
        }.each_pair do |action, action_int|
          describe "and with action set as '#{action}'" do
            let(:params) { {
              :action => action,
              :corner => corner,
            } }

            it "should set value to #{action_int}" do
              should contain_boxen__osx_defaults("Set the #{corner} hot corner to #{action}").with({
                :domain => 'com.apple.dock',
                :key    => "wvous-#{corner_abbrev}-corner",
                :type   => 'int',
                :value  => action_int,
                :user   => facts[:boxen_user],
                :notify => 'Exec[killall Dock]',
              })
            end
          end
        end

        {
          'command' => 1048576,
          'control' => 262144,
          'none'    => 0,
          'option'  => 524288,
          'shift'   => 131072,
        }.each_pair do |modifier, modifier_int|
          describe "and with modifier set as '#{modifier}'" do
            let(:params) { {
              :corner   => corner,
              :modifier => modifier,
            } }

            it "should set value to #{modifier_int}" do
              should contain_boxen__osx_defaults("Set the modifier for the #{corner} hot corner to #{modifier}").with({
                :domain => 'com.apple.dock',
                :key    => "wvous-#{corner_abbrev}-modifier",
                :type   => 'int',
                :value  => modifier_int,
                :user   => facts[:boxen_user],
                :notify => 'Exec[killall Dock]',
              })
            end
          end
        end
      end
    end
  end
end
