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
        parsed_page = Nokogiri::HTML(unparsed_page)
        top_3_news = Hash.new
        (0..2).each do |n|
            title = parsed_page.css(@title)[n].text.delete("\n""\t")
            title_content = parsed_page.css(@content)[n].text.delete("\n""\t")
            top_3_news[title] = title_content
        end
        return top_3_news
    end
end
p Headlines.new(Internation.new.package).scrape

