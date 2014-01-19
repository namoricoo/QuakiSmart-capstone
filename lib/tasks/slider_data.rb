class SliderData
  def self.get_from_value(input_string)    
    colon_location = input_string.index(';')
    input_string.slice(0, colon_location).to_f
  end

  def self.get_to_value(input_string)    
    colon_location = input_string.index(';')
    end_of_string = input_string.length
    input_string.slice(colon_location + 1 , end_of_string).to_f
  end
end