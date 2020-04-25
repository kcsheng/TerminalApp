require_relative "./presentation"
require 'io/console'
require "./fetch"

clear
logo
indent
type("Welcome to News Express! Press any key to continue...".colorize(:blue))
pause

def show_news(selection)
    begin
      headlines = case selection
        when "world news"
              Headlines.new(Internation.new.package).scrape
        when "national news"
              Headlines.new(Nation.new.package).scrape
        when "sports news"
              Headlines.new(Sports.new.package).scrape
      end
    rescue
        no_service
        pause
        return
    end
    headlines.each do |k, v|
        br
        puts k.colorize(:cyan)
        fast_type(v)
        br
    end
    br
    br
    print "Press any key to return to the main menu."
    pause
    clear
end

loop do
    clear
    br
    case main_menu
        when "World News"
            br
            puts "Reuters current top 5 headlines are: ".colorize(:blue)
            show_news("world news")
        when "National News"
            br
            country_site = Nation.new.package[0]
            puts "#{country_site} current top 5 headlines are: ".colorize(:blue)
            show_news("national news")
        when "International Sports"
            br
            puts "Reuters current top 5 sports headlines are: ".colorize(:blue)
            show_news("sports news")
        when "Quit"
            br
            indent
            type("Bye now. Have a great day!".colorize(:blue))
            br
            br
            break
    end
end
