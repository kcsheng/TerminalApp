require "test/unit"
require "./fetch"

class LocalHeadlineTest < Test::Unit::TestCase
    # Check the present top headline on the website and compare it against 
    # the first key value pair from the scrape function
    def test_first_headline
        assert_equal("POWER SHIFT: Meet the woman who could soon be ruler of North Korea", Headlines.new(Nation.new.package).scrape.keys[0])
    end
    def test_first_content
        assert_equal("She’s been described as the “North Korean Ivanka Trump”. Now the young, ambitious Kim Yo Jong is rumoured to take over the hermit nation if her brother dies.", Headlines.new(Nation.new.package).scrape.values[0])
    end
end




