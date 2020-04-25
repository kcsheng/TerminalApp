require "tty-prompt"
require "colorize"


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

def pause
  STDIN.getch
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
    sleep(0.004)
  end
end

def no_service
  puts "
  This service is currently unavailable!
  Press any key to return to the main menu.
  ".colorize(:red)
end

def main_menu
  prompt = TTY::Prompt.new
  choices = ["World News", "National News", "International Sports", "Quit"]
  prompt.select("Please choose one from the following options.", choices)
end
