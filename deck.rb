# renamed "@deckk" to "@cards"--another style thing
# also removed extra, unnecessary spaces between codes
require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    suits = %w(Hearts Diamonds Clubs Spades)
    values = (2..10).to_a
    @cards = []
    suits.each do |suit|
      values.each do |value|
        @cards << Card.new(suit, value, value)
      end

      @cards << Card.new(suit, 10, "J")
      @cards << Card.new(suit, 10, "Q")
      @cards << Card.new(suit, 10, "K")
      @cards << Card.new(suit, 11, "A")

    end
    shuffle!
  end

  def shuffle!
    cards.shuffle!
  end

end
