require "nokogiri"
require "httparty"
require "./package"

class Headlines
    def initialize(package)
        @url = package[0]
        @title = package[1]
        @content = package[2]
    end
    def scrape
        unparsed_page = HTTParty.get(@url)
        parsed_page = Nokogiri::HTML(unparsed_page.body)
        top_5_news = Hash.new
        (0..4).each do |n|
            title = parsed_page.css(@title)[n].text.delete("\n""\t")
            title_content = parsed_page.css(@content)[n].text.delete("\n""\t")
            top_5_news[title] = title_content
        end
        return top_5_news
    end
end

