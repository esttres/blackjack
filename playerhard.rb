



class Player

  attr_accessor :name,
                :hand,
                :number_of_wins,
                :number_of_losses

  def initialize (name = "noname", 
                  hand = [],
                  number_of_wins = 0,
                  number_of_losses = 0)

    @name = name
    @hand = hand
    @number_of_wins = number_of_wins
    @number_of_losses = number_of_losses

  end

  def hit(deck, current_dealer_hand)
    @hand << deck.shift
    puts
    puts "#{@name}, your hand is now,"
    puts

    @hand.each do |card|

      puts "#{card.face} of #{card.suit},"

    end
    
    puts
    puts "Your total is #{player_score}"

    if @hand.length == 6 && player_score < 22
      puts "You win, you have successfully hit 4 times and you have not BUSTED!"
      play_again
      @number_of_wins += 1 
    end

    puts
    puts "Dealer is currently showing #{current_dealer_hand[0].face} of #{current_dealer_hand[0].suit}"
    puts

  end

  def player_score

    @hand.inject(0){ |sum, hand_elements| sum + hand_elements.value }

  end

  def dhit(deck)

    @hand << deck.shift

  end
end
