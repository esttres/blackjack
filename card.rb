#removed a couple things in the initialize method, cleaned it up a bit

class Card

  attr_accessor :suit,
                :value,
                :face

  def initialize (suit, value, face)
    @suit = suit
    @value = value
    @face = face
  end

end
