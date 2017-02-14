require_relative 'card'

class Deck

  attr_accessor :deck

  def initialize

    suits = %w(Hearts Diamonds Clubs Spades)
    values = (2..10).to_a
    @deck = []
    suits.each do |suit|
      values.each do |value|
        @deck << Card.new(suit, value, value)
      end

      @deck << Card.new(suit, 10, "J")
      @deck << Card.new(suit, 10, "Q")
      @deck << Card.new(suit, 10, "K")
      @deck << Card.new(suit, 11, "A")

    end
    
    shuffle!

  end

  def shuffle!
    @deck.shuffle!
  end

  def length_is
    @deck.length
  end



end

# deck = Deck.new

# puts deck.deck.inspect

# puts

# puts deck.deck.shuffle!.inspect

# puts deck.deck.length
