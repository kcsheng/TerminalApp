require_relative "./user"

# Implement inheritance to package data for scraping
class Site
    def initialize(url, title_css, content_css)
        @url = url
        @title_css = title_css
        @content_css = content_css
    end
    def package
        [@url, @title_css, @content_css]
    end
end

# css selectors need to pass the scraping function in fetch.rb, in order to be listed here.
class Internation < Site
    def initialize
        super("https://www.reuters.com/news/archive/worldNews", "h3.story-title", "p")
    end
end

class Sports < Site
    def initialize
        super("https://www.reuters.com/news/archive/sportsNews", "h3.story-title", "p")
    end
end

class Nation < Site
    user = User.new
# Australia is set as a temporary default. In the furture, more countries can be added.
# Case/when is used to reflect this.
# Sites added here must have passed the preliminary test with scrape function in fetch.rb.
    case user.country
      when "AU"
          def initialize
              super("https://www.news.com.au/", "h4.heading", "span.standfirst-text")
          end
      else
          def initialize
              super("https://www.news.com.au/", "h4.heading", "span.standfirst-text")
          end
    end
end
