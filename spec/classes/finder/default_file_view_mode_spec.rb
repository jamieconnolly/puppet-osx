require 'spec_helper'

describe 'osx::finder::default_file_view_mode' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::finder')
  end

  describe 'defaults' do
    it 'should set the value to "Nlsv"' do
      should contain_boxen__osx_defaults('Set the default file view mode').with({
        :domain => 'com.apple.finder',
        :key    => 'FXPreferredViewStyle',
        :type   => 'string',
        :value  => 'Nlsv',
        :user   => facts[:boxen_user],
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove all .DS_Store files]',
        ],
      })
    end
  end

  describe 'with mode set' do
    let(:params) { {:mode => 'columns'} }

    it 'should set the value to "clmv"' do
      should contain_boxen__osx_defaults('Set the default file view mode').with({
        :domain => 'com.apple.finder',
        :key    => 'FXPreferredViewStyle',
        :type   => 'string',
        :value  => 'clmv',
        :user   => facts[:boxen_user],
        :notify => [
          'Exec[killall Finder]',
          'Exec[Remove all .DS_Store files]',
        ],
      })
    end
  end
end
