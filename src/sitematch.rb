require_relative "./user"

# Workable sites with workable title and its content  
class SiteCss
    attr_accessor(:site, :title_css, :content_css)
    def initialize(site, title_css, content_css)
        @site = site
        @title_css = title_css
        @content_css = content_css
    end
end

class InternationCss < SiteCss
    def initialize
        super("https://www.reuters.com/news/archive/worldNews", "h3.story-title", "p")
    end
end

class SportsCss < SiteCss
    def initialize
        super("https://www.reuters.com/news/archive/sportsNews", "h3.story-title", "p")
    end
end

class NationCss < SiteCss
    user = User.new
    case user.country
    when "AU"
        def initialize
            super("https://www.news.com.au/", "h4.heading", "span.standfirst-text")
        end
    else
        # Australia is a temporary default. In the furture, more countries can be added.
        def initialize
            super("https://www.news.com.au/", "h4.heading", "span.standfirst-text")
        end
    end
end


