

require_relative 'cardgit'

class Deck

  attr_accessor :deckk

  def initialize

    suits = %w(Hearts Diamonds Clubs Spades)
    values = (2..10).to_a
    @deckk = []
    suits.each do |suit|
      values.each do |value|
        @deckk << Card.new(suit, value, value)
      end

      @deckk << Card.new(suit, 10, "J")
      @deckk << Card.new(suit, 10, "Q")
      @deckk << Card.new(suit, 10, "K")
      @deckk << Card.new(suit, 11, "A")

    end
    shuffle!
  end

  def shuffle!
    deckk.shuffle!
  end



end

# deck = Deck.new

# puts deck.deckk.inspect
#
# puts deck.deckk.shuffle!.inspect
#
# puts deck.deckk.length
