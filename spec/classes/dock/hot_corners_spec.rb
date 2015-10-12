require 'spec_helper'

describe 'osx::dock::hot_corners' do
  let(:facts) { {:boxen_user => 'ilikebees' } }

  describe 'defaults' do
    it do
      should_not contain_osx__dock__hot_corner('bottom left')
      should_not contain_osx__dock__hot_corner('bottom right')
      should_not contain_osx__dock__hot_corner('top right')
      should_not contain_osx__dock__hot_corner('top left')
    end
  end

  describe 'with $bottom_left set as string' do
    let(:params) { {:bottom_left => 'start screensaver'} }

    it 'should set up the "bottom left" hot corner' do
      should contain_osx__dock__hot_corner('bottom left').with({
        :action => 'start screensaver',
      })
      should_not contain_osx__dock__hot_corner('bottom right')
      should_not contain_osx__dock__hot_corner('top right')
      should_not contain_osx__dock__hot_corner('top left')
    end
  end

  describe 'with $bottom_left set as dict' do
    let(:params) { {:bottom_left => {
      'action'   => 'mission control',
      'modifier' => 'option',
    }} }

    it 'should set up the "bottom left" hot corner' do
      should contain_osx__dock__hot_corner('bottom left').with({
        :action   => 'mission control',
        :modifier => 'option',
      })
      should_not contain_osx__dock__hot_corner('bottom right')
      should_not contain_osx__dock__hot_corner('top right')
      should_not contain_osx__dock__hot_corner('top left')
    end
  end

  describe 'with $bottom_right set as string' do
    let(:params) { {:bottom_right => 'start screensaver'} }

    it 'should set up the "bottom right" hot corner' do
      should_not contain_osx__dock__hot_corner('bottom left')
      should contain_osx__dock__hot_corner('bottom right').with({
        :action => 'start screensaver',
      })
      should_not contain_osx__dock__hot_corner('top right')
      should_not contain_osx__dock__hot_corner('top left')
    end
  end

  describe 'with $bottom_right set as dict' do
    let(:params) { {:bottom_right => {
      'action'   => 'mission control',
      'modifier' => 'option',
    }} }

    it 'should set up the "bottom right" hot corner' do
      should_not contain_osx__dock__hot_corner('bottom left')
      should contain_osx__dock__hot_corner('bottom right').with({
        :action   => 'mission control',
        :modifier => 'option',
      })
      should_not contain_osx__dock__hot_corner('top right')
      should_not contain_osx__dock__hot_corner('top left')
    end
  end

  describe 'with $top_right set as string' do
    let(:params) { {:top_right => 'start screensaver'} }

    it 'should set up the "top right" hot corner' do
      should_not contain_osx__dock__hot_corner('bottom left')
      should_not contain_osx__dock__hot_corner('bottom right')
      should contain_osx__dock__hot_corner('top right').with({
        :action => 'start screensaver',
      })
      should_not contain_osx__dock__hot_corner('top left')
    end
  end

  describe 'with $top_right set as dict' do
    let(:params) { {:top_right => {
      'action'   => 'mission control',
      'modifier' => 'option',
    }} }

    it 'should set up the "top right" hot corner' do
      should_not contain_osx__dock__hot_corner('bottom left')
      should_not contain_osx__dock__hot_corner('bottom right')
      should contain_osx__dock__hot_corner('top right').with({
        :action   => 'mission control',
        :modifier => 'option',
      })
      should_not contain_osx__dock__hot_corner('top left')
    end
  end

  describe 'with $top_left set as string' do
    let(:params) { {:top_left => 'start screensaver'} }

    it 'should set up the "top left" hot corner' do
      should_not contain_osx__dock__hot_corner('bottom left')
      should_not contain_osx__dock__hot_corner('bottom right')
      should_not contain_osx__dock__hot_corner('top right')
      should contain_osx__dock__hot_corner('top left').with({
        :action => 'start screensaver',
      })
    end
  end

  describe 'with $top_left set as dict' do
    let(:params) { {:top_left => {
      'action'   => 'mission control',
      'modifier' => 'option',
    }} }

    it 'should set up the "top left" hot corner' do
      should_not contain_osx__dock__hot_corner('bottom left')
      should_not contain_osx__dock__hot_corner('bottom right')
      should_not contain_osx__dock__hot_corner('top right')
      should contain_osx__dock__hot_corner('top left').with({
        :action   => 'mission control',
        :modifier => 'option',
      })
    end
  end
end
