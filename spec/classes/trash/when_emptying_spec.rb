require 'spec_helper'

describe 'osx::trash::when_emptying' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  it do
    should include_class('osx::finder')

    should_not contain_boxen__osx_defaults('Toggle whether to securely empty the trash')
    should_not contain_boxen__osx_defaults('Toggle the warning when emptying the trash')
  end

  describe('with secure set') do
    let(:params) { {:secure => true} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle whether to securely empty the trash').with({
        :domain => 'com.apple.finder',
        :key    => 'EmptyTrashSecurely',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end

  describe('with warn set') do
    let(:params) { {:warn => true} }

    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle the warning when emptying the trash').with({
        :domain => 'com.apple.finder',
        :key    => 'WarnOnEmptyTrash',
        :type   => 'bool',
        :value  => true,
        :user   => facts[:boxen_user],
        :notify => 'Exec[killall Finder]',
      })
    end
  end
end
