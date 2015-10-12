require 'spec_helper'

describe 'osx::dock::style' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')
  end

  describe 'defaults' do
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Set the style of the Dock').with({
        :domain => 'com.apple.dock',
        :key    => 'no-glass',
        :type   => 'bool',
        :value  => false,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end

  describe 'with style set' do
    let(:params) { {:style => '2D'} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Set the style of the Dock').with({
        :domain => 'com.apple.dock',
        :key    => 'no-glass',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end
end
