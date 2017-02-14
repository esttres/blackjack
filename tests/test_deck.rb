require_relative 'deck'
require 'test/unit'

class TestDeck < Test::Unit::TestCase

    def test_deck
        assert_equal 52, Deck.new.length_is
        assert_instance_of Deck, Deck.new
    end

end