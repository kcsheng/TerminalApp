require "Geocoder"
require 'net/http'
ip = Net::HTTP.get URI "https://api.ipify.org"
class User
    attr_accessor(:ip)
    def initialize(ip)
    @ip = ip
    end

    def country
        Geocoder.search(@ip).first.country
    end
    def city
        Geocoder.search(@ip).first.city
    end
    def coord
        Geocoder.search(@ip).first.coordinates
    end
end
user = User.new(ip)