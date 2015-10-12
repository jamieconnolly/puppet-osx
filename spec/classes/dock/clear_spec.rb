require 'spec_helper'

describe 'osx::dock::clear' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::dock')

    should contain_boxen__osx_defaults('Prevent Launchpad from reappearing').with({
      :domain => 'com.apple.dock',
      :key    => 'checked-for-launchpad',
      :type   => 'bool',
      :value  => true,
      :user   => facts[:boxen_user],
      :notify => 'Exec[killall Dock]',
    })

    should contain_boxen__osx_defaults('Remove all the pinned apps').with({
      :domain => 'com.apple.dock',
      :key    => 'persistent-apps',
      :type   => 'array',
      :value  => '()',
      :user   => facts[:boxen_user],
      :notify => 'Exec[killall Dock]',
    })

    should contain_boxen__osx_defaults('Remove all the pinned stacks').with({
      :domain => 'com.apple.dock',
      :key    => 'persistent-others',
      :type   => 'array',
      :value  => '()',
      :user   => facts[:boxen_user],
      :notify => 'Exec[killall Dock]',
    })
  end
end
