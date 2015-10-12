require 'spec_helper'

describe 'osx::mouse::movement' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should_not contain_boxen__osx_defaults('Set the speed with which the mouse scrolls content')
    should_not contain_boxen__osx_defaults('Set the speed with which the mouse moves the cursor')
  end

  describe('with scrolling set') do
    let(:params) { {:scrolling => 5} }

    it 'should set the value to 5' do
      should contain_boxen__osx_defaults('Set the speed with which the mouse scrolls content').with({
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.scrollwheel.scaling',
        :type   => 'float',
        :value  => 5,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe('with tracking set') do
    let(:params) { {:tracking => 10} }

    it 'should set the value to 10' do
      should contain_boxen__osx_defaults('Set the speed with which the mouse moves the cursor').with({
        :domain => 'NSGlobalDomain',
        :key    => 'com.apple.mouse.scaling',
        :type   => 'float',
        :value  => 10,
        :user   => facts[:boxen_user],
      })
    end
  end
end
