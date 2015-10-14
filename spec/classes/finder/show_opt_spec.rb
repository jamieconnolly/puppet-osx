require 'spec_helper'

describe 'osx::finder::show_opt' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'defaults' do
    it do
      should contain_exec('Show /opt in the Finder').with({
        :command => 'chflags nohidden /opt',
        :user    => 'root',
        :onlyif  => 'ls -lOd /opt | grep hidden',
      })
      should_not contain_exec('Hide /opt in the Finder')
    end
  end

  describe 'enabled' do
    let(:params) { {:ensure => 'present'} }

    it do
      should contain_exec('Show /opt in the Finder').with({
        :command => 'chflags nohidden /opt',
        :user    => 'root',
        :onlyif  => 'ls -lOd /opt | grep hidden',
      })
      should_not contain_exec('Hide /opt in the Finder')
    end
  end

  describe 'disabled' do
    let(:params) { {:ensure => 'absent'} }

    it do
      should_not contain_exec('Show /opt in the Finder')
      should contain_exec('Hide /opt in the Finder').with({
        :command => 'chflags hidden /opt',
        :user    => 'root',
        :onlyif  => 'ls -lOd /opt | grep -v hidden',
      })
    end
  end
end
