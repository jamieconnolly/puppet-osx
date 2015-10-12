require 'spec_helper'

describe 'osx::finder::default_search_group_by' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should include_class('osx::finder')
  end

  describe('defaults') do
    it 'should set the value to "None"' do
      should contain_boxen__osx_defaults('Set the default grouping used when searching').with({
        :domain => 'com.apple.finder',
        :key    => 'FXPreferredGroupBy',
        :type   => 'string',
        :value  => 'None',
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

  describe('with grouping set') do
    let(:params) { {:grouping => 'date last opened'} }

    it 'should set the value to "Date Last Opened"' do
      should contain_boxen__osx_defaults('Set the default grouping used when searching').with({
        :domain => 'com.apple.finder',
        :key    => 'FXPreferredGroupBy',
        :type   => 'string',
        :value  => 'Date Last Opened',
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end
end
