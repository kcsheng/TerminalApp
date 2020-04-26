require "test/unit"
require_relative "../src/user.rb"
require_relative "../src/package.rb"

class LocationTest < Test::Unit::TestCase
    def test_location # Test current user's country and city
        user = User.new
        assert_equal("AU", user.country)
        assert_equal("Melbourne", user.city)
    end
end

class PackageTest < Test::Unit::TestCase
    def test_package # Test current user's national website package 
        user = User.new
        assert_equal(["https://www.news.com.au/", "h4.heading", "span.standfirst-text"], Nation.new.package)
    end
end
