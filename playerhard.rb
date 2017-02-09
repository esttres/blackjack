

class Player

  attr_accessor :name,
                :hand,
                :deck,
                :current_dealer_hand

  def initialize (name = "noname", hand = [])

    @name = name
    @hand = hand
    @deck = deck
    @current_dealer_hand = current_dealer_hand

  end

  def hit(deck, current_dealer_hand)
    hand << deck.shift
    puts
    puts "#{name}, your hand is now,"
    puts

    hand.each do |hand_elements|
      print hand_elements.face
      print " of "
      print "#{hand_elements.suit},"
      puts

    end
    
    puts
    puts "Your total is #{player_score}"

    if hand.length == 6 && player_score < 22
      puts "You win, you have successfully hit 4 times and you have not BUSTED!"
      play_again
    end

    puts
    puts "Dealer is currently showing #{current_dealer_hand[0].face} of #{current_dealer_hand[0].suit}"
    puts

  end

  def player_score

    hand.inject(0){ |sum, hand_elements| sum + hand_elements.value }

  end

  def dhit(deck)

    hand << deck.shift

  end

  def play_again
    exit
  end



end