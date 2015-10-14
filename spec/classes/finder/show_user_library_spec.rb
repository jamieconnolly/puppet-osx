require 'spec_helper'

describe 'osx::finder::show_user_library' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'defaults' do
    it do
      should contain_exec('Show ~/Library in the Finder').with({
        :command => 'chflags nohidden /Users/ilikebees/Library',
        :onlyif  => 'ls -lOd /Users/ilikebees/Library | grep hidden',
      })
      should_not contain_exec('Hide ~/Library in the Finder')
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it do
      should contain_exec('Show ~/Library in the Finder').with({
        :command => 'chflags nohidden /Users/ilikebees/Library',
        :onlyif  => 'ls -lOd /Users/ilikebees/Library | grep hidden',
      })
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it do
      should_not contain_exec('Show ~/Library in the Finder')
      should contain_exec('Hide ~/Library in the Finder').with({
        :command => 'chflags hidden /Users/ilikebees/Library',
        :onlyif  => 'ls -lOd /Users/ilikebees/Library | grep -v hidden',
      })
    end
  end
end
