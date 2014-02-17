require_relative '../../lib/earthquake_json/earthquake_class.rb'
require_relative '../spec_helper.rb'
# Test Load File into an Array
describe EarthquakeClass do
  it 'transforms input into hash {latitude: number,longitude: number}' do
    # [longitude,latitude,depth]
    input_array = [127.4955, 5.1454, 80.11]
    output_hash = { latitude: 5.1454, longitude: 127.4955 }
    earthquake = EarthquakeClass.new
    earthquake.set_coordinates(input_array)
    earthquake.get_location_hash.should == output_hash
  end
end
