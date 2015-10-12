require 'spec_helper'

describe 'osx::dock::magnification' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')
  end

  describe 'defaults' do
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle icon magnification').with({
        :domain => 'com.apple.dock',
        :key    => 'magnification',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
      should_not contain_boxen__osx_defaults('Set the magnified icon size')
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle icon magnification').with({
        :domain => 'com.apple.dock',
        :key    => 'magnification',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
      should_not contain_boxen__osx_defaults('Set the magnified icon size')
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle icon magnification').with({
        :domain => 'com.apple.dock',
        :key    => 'magnification',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
      should_not contain_boxen__osx_defaults('Set the magnified icon size')
    end
  end

  describe 'with magnified icon size set' do
    let(:params) { {:magnified_icon_size => 64} }

    it 'should set the value to 64' do
      should contain_boxen__osx_defaults('Set the magnified icon size').with({
        :domain => 'com.apple.dock',
        :key    => 'largesize',
        :type   => 'int',
        :value  => 64,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end
end
