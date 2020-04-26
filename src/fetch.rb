require "nokogiri"
require "httparty"
require "./package"

class Headlines
    def initialize(package)
        @url = package[0]
        @title = package[1]
        @content = package[2]
        @unparsed_page = HTTParty.get(@url)
        @parsed_page = Nokogiri::HTML(@unparsed_page.body)
    end
    def scrape
        top_5_news = Hash.new
        (0..4).each do |n|
            headline_title = @parsed_page.css(@title)[n].text.delete("\n""\t")
            headline_content = @parsed_page.css(@content)[n].text.delete("\n""\t")
            top_5_news[headline_title] = headline_content
        end
        top_5_news
    end
end
