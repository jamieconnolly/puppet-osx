require 'spec_helper'

describe 'osx::dock::icon_size' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')
  end

  describe 'defaults' do
    it 'should set the value to 36' do
      should contain_boxen__osx_defaults('Set the icon size').with({
        :domain => 'com.apple.dock',
        :key    => 'tilesize',
        :type   => 'int',
        :value  => 36,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end

  describe 'with size set' do
    let(:params) { {:size => 1} }

    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Set the icon size').with({
        :domain => 'com.apple.dock',
        :key    => 'tilesize',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end
end
