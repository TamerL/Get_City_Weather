require 'open_weather'
options = { units: "metric", APPID: "d42d9a366e77e489fbb606eaaaca7685" } 
out=OpenWeather::Current.city(ARGV[0], options)
if ARGV[0].nil? || ARGV[0].empty?
puts "please type a city name"
return
end
main=out["main"]
puts "Minimum temperature is #{main["temp_min"]}"
puts "Maximum temperature is #{main["temp_max"]}"
