require 'spec_helper'

describe 'osx::finder::default_location' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe('defaults') do
    it 'should set the value to "PfHm"' do
      should contain_boxen__osx_defaults('Set the default location when opening a new window').with({
        :domain => 'com.apple.finder',
        :key    => 'NewWindowTarget',
        :type   => 'string',
        :value  => 'PfHm',
        :user   => facts[:boxen_user],
      })
      should_not contain_boxen__osx_defaults('Set the default location path when opening a new window')
    end
  end

  describe('with location set') do
    let(:params) { {:location => 'all my files'} }

    it 'should set the value to "PfDo"' do
      should contain_boxen__osx_defaults('Set the default location when opening a new window').with({
        :domain => 'com.apple.finder',
        :key    => 'NewWindowTarget',
        :type   => 'string',
        :value  => 'PfDo',
        :user   => facts[:boxen_user],
      })
    end
  end

  describe('with path set') do
    let(:params) { {:path => '/tmp'} }

    it 'should not set anything' do
      should_not contain_boxen__osx_defaults('Set the default location path when opening a new window')
    end
  end

  describe('with location and path set') do
    let(:params) { {:location => 'other', :path => '/tmp'} }

    it 'should set the value to "file:///tmp"' do
      should contain_boxen__osx_defaults('Set the default location path when opening a new window').with({
        :domain => 'com.apple.finder',
        :key    => 'NewWindowTargetPath',
        :type   => 'string',
        :value  => 'file:///tmp',
        :user   => facts[:boxen_user],
      })
    end
  end
end
