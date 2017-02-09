require_relative 'card'
require 'test/unit'

class TestCard < Test::Unit::TestCase

    def test_card
        assert_instance_of Card, Card.new
    end

end

