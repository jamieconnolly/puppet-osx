require 'spec_helper'

describe 'osx::system::ui_server' do
  it do
    should contain_exec('killall SystemUIServer').with({
      :refreshonly => true
    })
  end
end
