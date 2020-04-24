require_relative "./presentation"
require 'io/console'

clear
logo
indent
type("Welcome to News Express! Press any key to continue...".colorize(:blue))
STDIN.getch

class View
    @browse = true
    @result
    while @browse 
        clear   
        br
        @result = case main_menu  
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
                @browse = false
        end
        STDIN.getch
        clear
    end
end







