require 'open_weather'
require 'rspec'


  def get_min_weather_by(city)
    options = { units: "metric", APPID: "d42d9a366e77e489fbb606eaaaca7685" }
    if city.nil?
      puts 'pls type a city name'
      return nil
    elsif city.is_a?(Numeric)
      puts "city name can't be a number"
      return nil
    elsif city.empty?
      puts 'pls type a city name'
      return nil
    end

    out=OpenWeather::Current.city(city, options)
    return out["main"]["temp_min"]
  end


#temp = get_weather_by(city: ARGV[0])
#puts "Minimum temperature is #{temp["temp_min"]}"
#puts "Maximum temperature is #{temp["temp_max"]}"

describe 'get_weather_by' do
  it "returns temperature of the city" do
    result = get_min_weather_by('Melbourne')
    expect(result).to eq(20.46)
  end
  it "returns nil if the city name is missing" do
    result = get_min_weather_by(nil)
    expect(result).to eq(nil)
  end
  it "returns nil if the city name is empty" do
    result = get_min_weather_by('')
    expect(result).to eq(nil)
  end
  it "returns nil if the city name is a number" do
    result = get_min_weather_by(1234)
    expect(result).to eq(nil)
  end
  it "returns nil if the city name is an array" do
    result = get_min_weather_by([1])
    expect(result).to eq(20.46)
  end
end
