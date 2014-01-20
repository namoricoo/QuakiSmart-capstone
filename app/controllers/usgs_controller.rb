require_relative '../../lib/tasks/slider_data.rb'
require_relative '../models/earthquake_class.rb'
require_relative '../models/geo_json_helper.rb'
# UsgsController
class UsgsController < ApplicationController
  #layout 'test_template'
  def initialize_varialbles
    @magnitude_from = 0.0
    @magnitude_to = 0.0 
  end

  def index   
     # empty out the table for each new visit.
    initialize_table
    
    earthquake_class = EarthquakeClass.new
    @table_header =  earthquake_class.get_table_header
    
    file_name = 'sample_earthquake.geojson'
    geo = GeoJsonHhelper.new
    result = geo.get_local_json_file(file_name)
    result_hash = geo.get_array_earthquake_hash(result)
    @table_body = geo.set_earthquake_features(result_hash)
    seed_database_with_data(@table_body)    
    @earthquakes = Earthquake.all
    @earthquake_hash = get_gmaps4rails_hash(@earthquakes)
  end

  def search
    earthquake_class = EarthquakeClass.new
    @table_header =  earthquake_class.get_table_header
     
    @magnitude_range =  params[:magnitude_range]
    @magnitude_from_value = SliderData.get_from_value(@magnitude_range);
    @magnitude_to_value = SliderData.get_to_value(@magnitude_range);
    
    @table_body = Earthquake.find_all_by_mag(@magnitude_from_value..@magnitude_to_value)
    
    @felt_range = params[:felt_range]
    @dimension_range = params[:dimension_range]
    @cdi_range = params[:cdi_range]
    @tsunami = params[:tsunami]
    
    @earthquake_hash = get_gmaps4rails_hash(@table_body)
  end

  def analytics
    
  end

  def about
    
  end

  def get_gmaps4rails_hash(arthquakes)
   earthquake_hash = {}
   earthquake_hash = Gmaps4rails.build_markers(@earthquakes) do |earthquake, marker|
      marker.lat earthquake.latitude
      marker.lng earthquake.longitude
    end
    earthquake_hash    
  end

  def seed_database_with_data(seed_hash_array)
    seed_hash_array.each do | hash_array |  
      Earthquake.create(hash_array)
    end
  end

  def initialize_table()
     Earthquake.destroy_all
  end
end
