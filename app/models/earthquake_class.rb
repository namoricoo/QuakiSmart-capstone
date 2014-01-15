# Earthquake class
class EarthquakeClass < ActiveRecord::Base
  attr_reader :earthquake_hash
  def initialize
    initialize_earthquake_hash
  end

  def initialize_earthquake_hash
    @earthquake_hash = {}
    @earthquake_hash[:mag] = ''
    @earthquake_hash[:place] = ''
    @earthquake_hash[:latitude] = ''
    @earthquake_hash[:longitude] = ''
    @earthquake_hash[:tsunami] = ''
    @earthquake_hash[:felt] = ''
    @earthquake_hash[:cdi] = ''
    @earthquake_hash[:dmin] = ''
  end

  def title_hash
    title_hash = {}
    title_hash['mag'] = :mag
    title_hash['place'] = :place
    title_hash['latitude'] = :latitude
    title_hash['longitude'] = :longitude
    title_hash['felt'] = :felt
    title_hash['tsunami'] = :tsunami
    title_hash['cdi'] = :cdi
    title_hash['dmin'] = :dmin
    title_hash
  end

  def get_table_header
    table_header_hash = {}
    table_header_hash['mag'] = 'Magnitude'
    table_header_hash['place'] = 'Place'
    table_header_hash['latitude'] = 'Latitude'
    table_header_hash['longitude'] = 'Longitude'
    table_header_hash['felt'] = 'Felt'
    table_header_hash['tsunami'] = 'Tsunami'   
    table_header_hash['dmin'] = 'Dimension'
    table_header_hash
  end

  def set_field(field_symbol, value)
    @earthquake_hash[field_symbol] = value
  end

  def get_field(field_symbol)
    @earthquake_hash[field_symbol]
  end

  def set_coordinates(coordinate_array)
    set_field(:latitude, coordinate_array[1])
    set_field(:longitude, coordinate_array[0])
  end

  def get_location_hash
    latitude_value = @earthquake_hash[:latitude]
    longitude_value = @earthquake_hash[:longitude]
    { latitude: latitude_value, longitude: longitude_value }
  end

  def print_hash
    puts "Earthquake hash= #{@earthquake_hash}"
  end
end
