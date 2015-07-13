#Since file names were changed, I updated the 'require' command to reflect that.
require_relative 'player'
require_relative 'deck'
require_relative 'card'

class Game

  attr_accessor :player,
                :dealer,
                :deck


  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Player.new("Dealer")
  end

  def play_again

    exit

  end
#changed some things stylistically in the "puts" command
  def player_blackjack

    if player_score == 21
      puts "You have Blackjack! You win!"
      play_again
    end

  end

  def dealer_blackjack

    if dealer_score == 21
      puts "Dealer has Blackjack! You lose!"
      play_again
    end

  end

  def player_check_for_bust

    if player_score > 21
      puts "You have busted."
      play_again
    end

  end

  def dealer_check_for_bust

    if dealer_score > 21
      puts "Dealer has busted!"
      play_again
    end

  end
# Instead of using a case statement, I turned it into simple control flow
# Also, instead of calling it "player_move_input", I called it "desire"
  def player_move
    puts "Do you want to hit or stay? [h/s]"
    desire = gets.chomp.downcase
    if desire == "h"
      player.hit(deck.cards,dealer.hand)
    elsif desire == "s"
      dealer_move
    else
      puts "Please enter a valid entry, 'h' or 's.''"
      player_move
    end
    player_check_for_bust
    player_move
  end

  def player_to_dealer_compare

    if player_score < dealer_score
      puts "You lose, the dealer had #{dealer_score}, you had #{player_score}."
      play_again
    elsif player_score == dealer_score

      if player.hand.length > dealer.hand.length
        puts "You win, you tied the dealer and you have more cards!"
        play_again
      elsif player.hand.length < dealer.hand.length
        puts "You lose, you tied the dealer and you have more cards!"
        play_again
      else
        puts "You win, you tied the dealer and you have the same number of cards!"
        play_again
      end

    else
      puts "You win, the dealer had #{dealer_score}, you had #{player_score}."
      play_again
    end

  end

  def dealer_move

    until dealer_score >= 16

      dealer.dhit(deck.cards)

    end

    puts "Dealer hand is "
    dealer.hand.each do |hand_elements|
      print hand_elements.face
      print " of "
      print "#{hand_elements.suit},"
      puts
    end

    dealer_check_for_bust

    player_to_dealer_compare

  end

  def self.first_dialog

    puts "Do you want to play Blackjack? [y/n]"
    desire = gets.chomp
      if desire == "y"
        Game.new.play
      elsif desire == "n"
        puts "Have a nice day!"
        exit
      else
        puts "Have a nice day!"
        exit
      end

  end

  def player_score

    player.hand.inject(0){|sum, hand_elements| sum + hand_elements.value}

  end

  def dealer_score

    dealer.hand.inject(0){|sum, hand_elements| sum + hand_elements.value}

  end

  def deal

    player.hand = [deck.cards.shift]
    dealer.hand = [deck.cards.shift]
    player.hand << deck.cards.shift
    dealer.hand << deck.cards.shift

    puts "You have #{player.hand[0].face} of #{player.hand[0].suit},"
    puts "#{player.hand[1].face} of #{player.hand[1].suit}."
    puts "Your total is #{player_score}."
    puts "Dealer is showing #{dealer.hand[0].face} of #{dealer.hand[0].suit}."
  end

  def play
    puts "What is your name?\n"
    player.name = gets.chomp.capitalize!

    deal
    dealer_blackjack
    player_check_for_bust
    player_blackjack
    player_move
  end

end

Game.first_dialog
