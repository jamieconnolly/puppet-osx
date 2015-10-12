require 'spec_helper'

describe 'osx::keyboard::key_repeat_delay' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'defaults' do
    it 'should set the value to 35' do
      should contain_boxen__osx_defaults('Set the key repeat delay').with({
        :domain => 'NSGlobalDomain',
        :key    => 'InitialKeyRepeat',
        :type   => 'int',
        :value  => 35,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'with delay set' do
    let(:params) { {:delay => 1} }

    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Set the key repeat delay').with({
        :domain => 'NSGlobalDomain',
        :key    => 'InitialKeyRepeat',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
    end
  end
end
