require_relative '../lib/tasks/geo_json_helper.rb'
require_relative 'spec_helper.rb'
# Test Load File into an Array
describe GeoJsonHhelper do
  it 'loads local geojson file into a Hash' do
    file_name = 'sample_earthquake.geojson'
    GeoJsonHhelper.new.get_local_json_file(file_name).should_not be_nil
  end
  # it 'loads remote geojson file into a Hash' do
    # first_half ='http://earthquake.usgs.gov/earthquakes/'
    # second_half = 'feed/v1.0/summary/2.5_day.geojson'
    # file_path = "#{first_half}#{second_half}"
    # GeoJsonHhelper.new.get_remote_json_file(file_path).should_not be_nil
  # end
  it 'extracts the geo json features from the rest of the document ' do
    file_name = 'sample_earthquake.geojson'
    geo = GeoJsonHhelper.new
    result = geo.get_local_json_file(file_name)
    geo.get_array_earthquake_hash(result).should_not be_nil
  end

  it 'sets Earthquake properties' do
    file_name = 'sample_earthquake.geojson'
    geo = GeoJsonHhelper.new
    result = geo.get_local_json_file(file_name)
    result_hash = geo.get_array_earthquake_hash(result)
    geo.set_earthquake_features(result_hash)
  end
end
