require "test/unit/assertions"
include Test::Unit::assertions

hello = "HELLO"

assert_equal "HELLO", hello, "Hello function should return 'world'"
