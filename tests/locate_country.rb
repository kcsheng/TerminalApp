require "Geocoder"
require 'net/http'
ip = Net::HTTP.get URI "https://api.ipify.org"
p country = Geocoder.search(ip).first.country
p city = Geocoder.search(ip).first.city
p coord = Geocoder.search(ip).first.coordinates