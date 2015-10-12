require 'spec_helper'

describe 'osx::keyboard::key_repeat_rate' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'defaults' do
    it 'should set the value to 0' do
      should contain_boxen__osx_defaults('Set the key repeat rate').with({
        :domain => 'NSGlobalDomain',
        :key    => 'KeyRepeat',
        :type   => 'int',
        :value  => 0,
        :user   => facts[:boxen_user],
      })
    end
  end

  describe 'with rate set' do
    let(:params) { {:rate => 1} }

    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Set the key repeat rate').with({
        :domain => 'NSGlobalDomain',
        :key    => 'KeyRepeat',
        :type   => 'int',
        :value  => 1,
        :user   => facts[:boxen_user],
      })
    end
  end
end
