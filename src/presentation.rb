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
  print "    "
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
    sleep(0.007)
  end
end

# def uparrow
#   print "\u2191".encode("utf-8")
# end

# def downarrow
#   print "\u2193".encode("utf-8")
# end

def main_menu
  prompt = TTY::Prompt.new
  choices = ["World News", "National News", "International Sports"]
  prompt.select("What would you like to browse?", choices)
end

def show_news(selection)
  headlines = case selection
    when "world news"; Headlines.new(Internation.new.package).scrape
    when "national news"; Headlines.new(Nation.new.package).scrape
    when "sports news"; Headlines.new(Sports.new.package).scrape
  end  
  headlines.each do |k, v|
    puts k.colorize(:cyan)
    puts fast_type(v)
  end
end



