require_relative "./presentation"
require 'io/console'

clear
logo
indent
type("Welcome to News Express! Press any key to continue...")
STDIN.getch
clear
br
class View
    @browse = true
    @result
    while @browse        
        @result = case main_menu        
            when "World News"
                puts "Reuters top 3 headlines are: ".colorize(:blue)
                show_news("world news")
            when "National News"
                country_site = Nation.new.package[0]
                puts "#{country_site} top 3 headlines are: ".colorize(:blue)
                show_news("national news")
            when "International Sports"
                puts "Reuters top 3 sports headlines are: ".colorize(:blue)
                show_news("sports news")
        end
        @browse = false
    end
end






