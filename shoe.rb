require_relative 'deck'

class Shoe

    attr_accessor :shoe

    def initialize
        
        @shoe = []

        7.times do
            singledeck = Deck.new
            singledeck.deck.each do |card|
                @shoe << card
            end
        end

        @shoe.shuffle!

    end

end

# shoe = Shoe.new

# puts shoe.shoe.inspect

# puts

# puts shoe.shoe.shuffle!.inspect

# puts shoe.shoe.length
