require_relative '../../lib/tasks/slider_data.rb'
require_relative '../models/earthquake_class.rb'
require_relative '../models/geo_json_helper.rb'
# UsgsController
class UsgsController < ApplicationController

  def initialize_varialbles
    @magnitude_from_value = -1
    @magnitude_to_value = 10
    @felt_from_value = 0
    @felt_to_value = 843
    @dimension_from_value = 0
    @dimension_to_value = 10
    @cdi_from_value = 0
    @cdi_to_value = 10
    @tsunami_boolean_value = 0
  end

  def get_local_data(geo)
    file_name = 'sample_earthquake.geojson'   
    geo.get_local_json_file(file_name)
  end

  def get_remote_data(geo)
    first_half ='http://earthquake.usgs.gov/earthquakes/'
    second_half = 'feed/v1.0/summary/2.5_day.geojson'
    file_path = "#{first_half}#{second_half}"   
    geo.get_remote_json_file(file_path)    
  end

  def index     
    initialize_table
    initialize_varialbles
    earthquake_class = EarthquakeClass.new
    @table_header =  earthquake_class.get_table_header   
    geo = GeoJsonHhelper.new    
    result = get_remote_data(geo)
    result_hash = geo.get_array_earthquake_hash(result)
    @table_body = geo.set_earthquake_features(result_hash)
    seed_database_with_data(@table_body)    
    @earthquakes = Earthquake.all
    @earthquake_hash = get_gmaps4rails_hash(@earthquakes)
  end

  def search
    earthquake_class = EarthquakeClass.new
    @table_header =  earthquake_class.get_table_header     
    get_magnitude_range
    get_felt_range    
    get_dimension_range
    get_cdi_range
    @tsunami_boolean_value = params[:tsunami].to_i
    @table_body = final_quakismart_slider_search
    @earthquakes = final_quakismart_slider_search
    @earthquake_hash = get_gmaps4rails_hash(@earthquakes)
  end

  def analytics
    
  end

  def about    
  end

  def get_magnitude_range
    @magnitude_range =  params[:magnitude_range]
    @magnitude_from_value = SliderData.get_from_value(@magnitude_range)
    @magnitude_to_value = SliderData.get_to_value(@magnitude_range)   
  end

  def get_felt_range
    @felt_range = params[:felt_range]
    @felt_from_value = SliderData.get_from_value(@felt_range)
    @felt_to_value = SliderData.get_to_value(@felt_range)    
  end

  def get_dimension_range
    @dimension_range = params[:dimension_range]
    @dimension_from_value = SliderData.get_from_value(@dimension_range)
    @dimension_to_value = SliderData.get_to_value(@dimension_range) 
  end

  def get_cdi_range
    @cdi_range = params[:cdi_range]    
    @cdi_from_value = SliderData.get_from_value(@cdi_range)
    @cdi_to_value = SliderData.get_to_value(@cdi_range) 
  end   

  def final_quakismart_slider_search
    Earthquake.find(:all,
    conditions: {
    tsunami: @tsunami_boolean_value,  
    mag:  @magnitude_from_value..@magnitude_to_value,
    felt: @felt_from_value..@felt_to_value,
    dmin:  @dimension_from_value..@dimension_to_value,
    cdi: @cdi_from_value..@cdi_to_value })
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
     # empty out the table for each new visit.
     Earthquake.destroy_all
  end
end
