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
    @magnitude_range =  params[:magnitude_range]
    @felt_range = params[:felt_range]
    @dimension_range = params[:dimension_range]
    @cdi_range = params[:cdi_range]
    @tsunami = params[:tsunami].to_s
    puts "--------------------------------------"
    puts "@magnitude_range= #{@magnitude_range}"
    puts "@felt_range= #{@felt_range}"
    puts "@dimension_range= #{@dimension_range}"
    puts "@cdi_range= #{@cdi_range}"
    puts "@tsunami= #{@tsunami}"
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
