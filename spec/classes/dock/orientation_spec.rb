require 'spec_helper'

describe 'osx::dock::orientation' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')
  end

  describe 'defaults' do
    it 'should set the value to "bottom"' do
      should contain_boxen__osx_defaults('Set the Dock orientation').with({
        :domain => 'com.apple.dock',
        :key    => 'orientation',
        :type   => 'string',
        :value  => 'bottom',
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end

  describe 'with orientation set' do
    let(:params) { {:orientation => 'right'} }

    it 'should set the value to "right"' do
      should contain_boxen__osx_defaults('Set the Dock orientation').with({
        :domain => 'com.apple.dock',
        :key    => 'orientation',
        :type   => 'string',
        :value  => 'right',
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Dock]',
      })
    end
  end
end
