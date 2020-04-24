require "tty-prompt"
require "colorize"
require "./fetch"

def logo
  puts <<-'EOF'

  _   _                     _____                            
 | \ | |                   |  ___|                           
 |  \| | _____      _____  | |____  ___ __  _ __ ___ ___ ___ 
 | . ` |/ _ \ \ /\ / / __| |  __\ \/ | '_ \| '__/ _ / __/ __|
 | |\  |  __/\ V  V /\__ \ | |___>  <| |_) | | |  __\__ \__ \
 \_| \_/\___| \_/\_/ |___/ \____/_/\_| .__/|_|  \___|___|___/
                                     |_|                                         
 
 
  EOF
end

def br
  puts 
end

def clear
  puts `clear`
end

def indent
  print "     "
end

def type(chars)
    chars.each_char do |char| 
      print char 
      sleep(0.03)
    end
end

def fast_type(chars)
  chars.each_char do |char| 
    print char 
    sleep(0.005)
  end
end

def main_menu
  prompt = TTY::Prompt.new
  choices = ["World News", "National News", "International Sports", "Quit"]
  prompt.select("Please choose one from the following options.", choices)
end

def show_news(selection)
  headlines = case selection
    when "world news"
      begin
       Headlines.new(Internation.new.package).scrape
      rescue NoMethodError
        puts "The international news is currently unvailable due to the change of the source site!"
        puts "Try again later."
        exit
      end     
    when "national news"
      begin 
      Headlines.new(Nation.new.package).scrape
      rescue NoMethodError
        puts "The national news is currently unavailable due to the change of the source site!"
        puts "Try again later."
        exit
      end
    when "sports news"
      begin
       Headlines.new(Sports.new.package).scrape
      rescue NoMethodError
        puts "The sports news is currently unavailable due to the change of the source site!"
        puts "Try again later."
        exit
      end
  end  
  headlines.each do |k, v|
    br
    puts k.colorize(:cyan)
    fast_type(v)
    br
  end
  br
  print "Press any key to return to the main menu."
end

