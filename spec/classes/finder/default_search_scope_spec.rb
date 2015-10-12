require 'spec_helper'

describe 'osx::finder::default_search_scope' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should include_class('osx::finder')
  end

  describe('defaults') do
    it 'should set the value to "SCcf"' do
      should contain_boxen__osx_defaults('Set the default scope used when searching').with({
        :domain => 'com.apple.finder',
        :key    => 'FXDefaultSearchScope',
        :type   => 'string',
        :value  => 'SCcf',
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

  describe('with scope set') do
    let(:params) { {:scope => 'this mac'} }

    it 'should set the value to "SCev"' do
      should contain_boxen__osx_defaults('Set the default scope used when searching').with({
        :domain => 'com.apple.finder',
        :key    => 'FXDefaultSearchScope',
        :type   => 'string',
        :value  => 'SCev',
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end
end
