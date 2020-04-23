require "nokogiri"
require "httparty"
require "byebug"
def scrape
    url = "https://www.reuters.com/news/archive/worldNews"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page) 
    top_three_news = Hash.new
    (0..2).each do |n|
        title = parsed_page.css("h3.story-title")[n].text.gsub("\n\t\t\t\t\t\t\t\t","")
        title_content = parsed_page.css("p")[n].text
        top_three_news[title] = title_content
    end
    p top_three_news
    byebug
end
scrape