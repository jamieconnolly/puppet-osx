require 'spec_helper'

describe 'osx::desktop::displayed_items' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should include_class('osx::finder')
  end

  describe 'with $internal_hard_drives param set to true' do
    let(:params) { {:internal_hard_drives => true} }

    it 'should show internal hard drives on desktop' do
      should contain_boxen__osx_defaults('Show internal drives on the Desktop').with({
        :domain => 'com.apple.finder',
        :key    => 'ShowHardDrivesOnDesktop',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
      should_not contain_boxen__osx_defaults('Show external drives on the Desktop')
      should_not contain_boxen__osx_defaults('Show mounted servers on the Desktop')
      should_not contain_boxen__osx_defaults('Show mounted media on the Desktop')
    end
  end

  describe 'with $external_hard_drives param set to true' do
    let(:params) { {:external_hard_drives => true} }

    it 'should show extenal hard drives on desktop' do
      should_not contain_boxen__osx_defaults('Show internal drives on the Desktop')
      should contain_boxen__osx_defaults('Show external drives on the Desktop').with({
        :domain => 'com.apple.finder',
        :key    => 'ShowExternalHardDrivesOnDesktop',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
      should_not contain_boxen__osx_defaults('Show mounted servers on the Desktop')
      should_not contain_boxen__osx_defaults('Show mounted media on the Desktop')
    end
  end

  describe 'with $mounted_servers param set to true' do
    let(:params) { {:mounted_servers => true} }

    it 'should show mounted servers on desktop' do
      should_not contain_boxen__osx_defaults('Show internal drives on the Desktop')
      should_not contain_boxen__osx_defaults('Show external drives on the Desktop')
      should contain_boxen__osx_defaults('Show mounted servers on the Desktop').with({
        :domain => 'com.apple.finder',
        :key    => 'ShowMountedServersOnDesktop',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
      should_not contain_boxen__osx_defaults('Show mounted media on the Desktop')
    end
  end

  describe 'with $removable_media param set to true' do
    let(:params) { {:removable_media => true} }

    it 'should show mounted media on desktop' do
      should_not contain_boxen__osx_defaults('Show internal drives on the Desktop')
      should_not contain_boxen__osx_defaults('Show external drives on the Desktop')
      should_not contain_boxen__osx_defaults('Show mounted servers on the Desktop')
      should contain_boxen__osx_defaults('Show mounted media on the Desktop').with({
        :domain => 'com.apple.finder',
        :key    => 'ShowRemovableMediaOnDesktop',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end
end
