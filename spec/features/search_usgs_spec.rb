require 'spec_helper'

describe "is able to search quakismart" do
  before :each do
     visit '/usgs/index'
  end

  it 'should fill in magnitude value' do     
     fill_in 'magnitude_range',with: '0;0'
  end

  it 'should fill in felt_range value' do     
     fill_in 'felt_range',with: '0;0'
  end

  it 'should fill in dimension_range value' do     
     fill_in 'dimension_range',with: '0;0'
  end

  it 'should fill in dimension_range value' do     
     fill_in 'cdi_range',with: '0;0'
  end

  it 'should click reset Link' do     
     click_link 'Reset'
  end  
end