require 'spec_helper'

describe 'osx::finder' do
  it do
    should contain_exec('killall Finder').with({
      :refreshonly => true,
    })

    should contain_exec('Remove all .DS_Store files').with({
      :command     => 'find / -xdev -name .DS_Store -delete',
      :user        => 'root',
      :refreshonly => true,
    })
  end
end
