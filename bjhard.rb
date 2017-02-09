
require_relative 'playerhard'
require_relative 'deck'

class Game

  attr_accessor :bjdeck,
                :player,
                :dealer


  def initialize

    @bjdeck = Deck.new
    @player = Player.new
    @dealer = Player.new ("Dealer")

  end

  def play_again

    exit

  end

  def check_for_blackjack_player

    if player_score == 21
      puts
      puts "You have BlackJack!  You have WON!"
      puts
      play_again
    end

  end

  def check_for_blackjack_dealer

    if dealer_score == 21
      puts
      puts "Dealer has BlackJack!  You have LOST!"
      puts
      play_again
    end

  end

  def player_check_for_bust

    if player_score > 21
      puts
      puts "You have busted!"
      puts
      play_again
    end

  end

  def dealer_check_for_bust

    if dealer_score > 21
      puts
      puts "Dealer has busted!"
      puts
      play_again
    end

  end

  def player_move

    puts
    puts "Do you want to Hit, or Stay, h or s\n"
    player_move_input = gets.chomp.downcase

    case player_move_input
      when "h"

        player.hit(bjdeck.deckk,dealer.hand)

      when "s"

        dealer_move

      else
        puts
        puts "Please enter a valid entry, h or s!\n"
        puts
        player_move
    end

    player_check_for_bust
    player_move

  end

  def player_to_dealer_compare

    if player_score < dealer_score
      puts
      puts "You LOSE, the Dealer had #{dealer_score}, You had #{player_score}"
      puts
      play_again
    elsif player_score == dealer_score

      if player.hand.length > dealer.hand.length
        puts
        puts "You WIN, you tied the dealer and you have more cards!"
        puts
        play_again
      elsif player.hand.length < dealer.hand.length
        puts
        puts "You LOSE, you tied the dealer and you have more cards!"
        puts
        play_again
      else
        puts
        puts "You WIN, you tied the dealer and you have the same number of cards!"
        puts
        play_again
      end

    else
      puts
      puts "You WIN, the Dealer had #{dealer_score}, You had #{player_score}"
      puts
      play_again
    end

  end

  def dealer_move

    until dealer_score >= 16

      dealer.dhit(bjdeck.deckk)

    end

    puts
    puts "Dealer hand is "
    puts

    dealer.hand.each do |hand_elements|
      print hand_elements.face
      print " of "
      print "#{hand_elements.suit},"
      puts
    end

    dealer_check_for_bust

    player_to_dealer_compare

  end

  def self.first_Dialog

    puts "Do you want to play BlackJack? (y or n)"
    playanswer = gets.chomp
    puts

      case playanswer
        when "n"
          puts "Have a nice day!"
          exit
        when "y"
          puts "Let's Play\n"
          puts
          Game.new.play
        else
          puts "Have a nice day!"
          play_again
      end

  end

  def player_score

    player.hand.inject(0){ |sum, hand_elements| sum + hand_elements.value }

  end

  def dealer_score

    dealer.hand.inject(0){ |sum, hand_elements| sum + hand_elements.value }

  end

  def deal

    player.hand = [bjdeck.deckk.shift]
    dealer.hand = [bjdeck.deckk.shift]
    player.hand << bjdeck.deckk.shift
    dealer.hand << bjdeck.deckk.shift

    puts
    puts "#{player.name}, You have"
    puts
    puts "#{player.hand[0].face} of #{player.hand[0].suit},"
    puts "#{player.hand[1].face} of #{player.hand[1].suit}"
    puts
    puts "Your total is #{player_score} "
    puts
    puts "Dealer is showing #{dealer.hand[0].face} of #{dealer.hand[0].suit}"
    puts

  end

  def play

    puts "What is your name?\n"
    player.name = gets.chomp.capitalize!

    deal
    check_for_blackjack_dealer
    player_check_for_bust
    check_for_blackjack_player
    player_move

  end


end

Game.first_Dialog
