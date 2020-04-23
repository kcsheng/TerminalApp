require "nokogiri"
require "httparty"
def scrape_nat
    url = "https://www.news.com.au/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)     
    title = parsed_page.css("h4.heading")[0].text.delete("\n""\t")
    title_content = parsed_page.css("span.standfirst-text")[0].text.delete("\n""\t") 
    top_three_news = Hash.new
    (0..2).each do |n|
        title = parsed_page.css("h4.heading")[n].text.delete("\n""\t") 
        title_content = parsed_page.css("span.standfirst-text")[n].text.delete("\n""\t")
        top_three_news[title] = title_content
    end
    p top_three_news
end
scrape_nat