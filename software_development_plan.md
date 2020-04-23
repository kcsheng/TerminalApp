## Software Development Plan
#####by KC Sheng

### Statement of purpose and scope:

This app will provide three options to the user including international and national headlines and sports. Other features, such as weather, lifestyle and finance, may be implemented in the future. This app will be able to display international news and sports headlines upon release. With the national headlines, it requires significant amount of effort to identify the new source in different countries. As such, there will be only one country (Australia) to start off when the app is launched. This app is however equipped with the ability to identify the geographical location of the user. In future update, there will be more countries included. Some users will then have the opportunity to view their national news from the terminal. For now, Australia is set as the default.

In order to build this app, apart from implementing ruby class and modules, I will utilise a few ruby gems, including nokogiri, httparty, byegug and Geocoder. Nokogiri allows text-scraping from a web site. I am mindful of the legality side of this and therefore the source site will be fully acknowledged. Geocoder will identify the location of the user, which is imperative to display national news via the country code.

In my initial brainstorming session, I have also explored the idea of building an app on "self improvement". This app basically could ideally provide a daily dose of motivation, as well as advices on fitness, mental health and personal relationships, in forms of quotes, graphics or videos. However, this idea does not seem to be quite fitting in to professionals who work with the terminal.

At the end, I have decided that the news-style terminal app may be more useful and purposeful to my target audience. Through developing this app, I hope to also consolidate my ability to code using Ruby and its gem library.

### Features

### The ability of the program to fetch international news and sports headline from a news site.
There are a few methods available on the web for scraping content from a website. After experimenting with a few, the method that I feel most comfortable and confident with is a combination of "httparty", "nokogiri" and "byebug" gems. This is the method I will adopt throughout the web scraping.

I use httparty to first obtain the the raw content from a website and pass it to nokogiri which then parse the html in a format that is extractable. Byebug is debugger that allows me to interact with the variables and select the final result. The trial code for implementation is demonstrated as below.

```
require "nokogiri"
require "httparty"
require "byebug"

def scrape
    url = "https://www.reuters.com/news/archive/worldNews"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)    
    byebug
end
```

By inspecting the site using the chrome extension, I first locate where the target elements are. Nokogiri gem recognises the content through css. However, finding the right pattern for extraction is a highly demanding task. For the international news, I extract headline and its content as a pair into a hash. Top three headlines are extracted and stored. Once the elements are successfully selected. They can then be displayed without the requirement of byebug.

Similar to the international headlines, sports headlines will also be extracted, stored and displayed.

### The ability of the program to fetch national news.
Following many trials and errors, I have decided to use the net/http library combined with Geocoder gem to identify the country where the user is located. First, the user's public IP can be fetched by net/http by sending request to ipify API. Geocoder gem can then take up the IP address, process it and return the country. Users in the countries listed will receive corresponding national news headlines.

Unlike the international news, fetching the national news requires an English news site for each country. With the limit time to finish the first stage of the project, it is not feasible to include multiple countries. Hence, I have only set up a site for Australia. Australia will also be the temporary default for users who are located elsewhere, even though geocode will still locate which country the user is located. In future updates, I hope to include more countries through collaborative effort worldwide.

In terms of extracting text by css, because the css style is dramatically different from site to site, a lengthy css name with spaces can be especially challenging. With many trials and errors, I manage to finally settle on sites that work well with my trial exercises.

### The ability of the program to display the content with aesthetics.
For the reading pleasure of the user, I aim to display the content in an eye-pleasing way. The text will ideally be block or boxed content displayed in the screen. With the aid of tty gem, I hope to enhance the user's experience. The welcome screen will be ascii art. At the beginning the user will be asked to select an option from the menu. The option will lead them to the content. I may implement the slow type feature on the screen to enhance the visual effect.

### User interaction and experience
At the beginning of the program, the user will see a welcome screen which displays 3 options: International news, national news and local weather. The user will use arrow keys to select appropriate option. This ensures the consistency of the input with no room for an error.

### Status update
Update 1: Web scraping relying on CSS selectors and names are quite tricky. The way that I use nokogiri is, first looking for the closest css selector and then testing it against array index to find top 3 headlines. I am forced to abandon some news sites as their css do not conform with my methodology. These sites usually require the use of XML path expression syntax to locate the target text.

Update 2: The other challenge I face is how I can organise and retrieve the data of website urls and their css selectors that have passed my initial selection test in a clean way. I have finally decided to use superclass and subclass relationship to deal with this problem. I can assign specific data to the subclass instance variables which are inherited from the superclass.
