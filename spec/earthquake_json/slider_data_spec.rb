require_relative '../spec_helper'
require_relative'../../lib/tasks/slider_data.rb'
describe SliderData do
  it 'Get the from value in the slider' do
    input = '0.2;7'
    output = 0.2    
    SliderData.get_from_value(input).should == output
  end
  it 'Get the to value in the slider' do
    input = '0.2;7.5'
    output = 7.5    
    SliderData.get_to_value(input).should == output
  end
end
