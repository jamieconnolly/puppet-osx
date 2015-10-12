require 'spec_helper'

describe 'osx::system::update::schedule' do
  describe 'defaults' do
    it 'should set the value to 7' do
      should contain_boxen__osx_defaults('Set the interval between software update checks').with({
        :domain => '/Library/Preferences/com.apple.SoftwareUpdate',
        :key    => 'ScheduleFrequency',
        :type   => 'int',
        :value  => 7,
        :user   => 'root',
      })
    end
  end

  describe 'with frequency set' do
    let(:params) { {:frequency => 'daily'} }

    it 'should set the value to 1' do
      should contain_boxen__osx_defaults('Set the interval between software update checks').with({
        :domain => '/Library/Preferences/com.apple.SoftwareUpdate',
        :key    => 'ScheduleFrequency',
        :type   => 'int',
        :value  => 1,
        :user   => 'root',
      })
    end
  end
end
