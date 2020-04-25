require "Geocoder"
require "net/http"
require "colorize"
class User
    attr_reader(:ip)
    def initialize
        @ip = Net::HTTP.get URI "https://api.ipify.org"
        rescue SocketError
            puts "

            There is no internet connection!

            ".colorize(:red)
            exit
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
