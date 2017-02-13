
require_relative 'playerhard'
require_relative 'deck'

class Game

  @@number_of_games_played = 0

  attr_accessor :bjdeck,
                :player,
                :dealer


  def initialize

    @bjdeck = Deck.new
    @player = Player.new
    @dealer = Player.new ("Dealer")

  end

  def play_again

    # Inserted for automatic play
    play_again_auto

    puts "Do you want to play another game of BlackJack? (y or n)"
    playanswer = gets.chomp.downcase
    puts

      case playanswer
        when "n"
          puts "Have a nice day!"
          exit
        when "y"
          puts "Let's Play\n"
          play
        else
          puts "Have a nice day!"
          exit
      end

  end

  def play_again_auto

    puts "Do you want to play another game of BlackJack? (y or n)"

    until @@number_of_games_played == 10
     
      playanswer = "y"
      puts

      case playanswer
        when "n"
          puts "Have a nice day!"
          exit
        when "y"
          puts "Let's Play\n"
          play
      end

    end

  end

  def check_for_blackjack_player

    if player_score == 21
      puts
      puts "You have BlackJack!  You have WON!"
      @player.number_of_wins += 1 
      puts
      play_again
    end

  end

  def check_for_blackjack_dealer

    if dealer_score == 21
      puts
      puts "Dealer has BlackJack!  You have LOST!"
      @player.number_of_losses += 1 
      puts
      play_again
    end

  end

  def player_check_for_bust

    if player_score > 21
      puts
      puts "You LOST, You have busted!"
      @player.number_of_losses += 1 
      puts
      play_again
    end

  end

  def dealer_check_for_bust

    if dealer_score > 21
      puts
      puts "You WIN, Dealer has busted!"
      @player.number_of_wins += 1 
      puts
      play_again
    end

  end

  def player_move

    # Inserted for Autoplay
    player_move_auto

    puts
    puts "Do you want to Hit, or Stay (h or s)\n"
    player_move_input = gets.chomp.downcase

    case player_move_input
      when "h"
        check_number_of_cards_in_deck
        @player.hit(@bjdeck.deckk,@dealer.hand)

      when "s"

        dealer_move

      else
        puts
        puts "Please enter a valid entry (h or s)!\n"
        puts
        player_move
    end

    player_check_for_bust
    player_move

  end

  def player_move_auto

    puts
    puts "Do you want to Hit, or Stay (h or s)\n"

    if player_score <=16
      player_move_input = "h"
      puts "h"    
    else
      player_move_input = "s"
      puts "s"
    end

    case player_move_input
      when "h"

        check_number_of_cards_in_deck
        @player.hit(@bjdeck.deckk,@dealer.hand)

      when "s"

        dealer_move

      else
        puts
        puts "Please enter a valid entry (h or s)!\n"
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
      @player.number_of_losses += 1 
      puts
      play_again
    elsif player_score == dealer_score

      if @player.hand.length > @dealer.hand.length
        puts
        puts "You WIN, you tied the dealer and you have more cards!"
        @player.number_of_wins += 1 
        puts
        play_again
      elsif @player.hand.length < @dealer.hand.length
        puts
        puts "You LOSE, you tied the dealer and you have more cards!"
        @player.number_of_losses += 1 
        puts
        play_again
      else
        puts
        puts "You WIN, you tied the dealer and you have the same number of cards!"
        @player.number_of_wins += 1 
        puts
        play_again
      end

    else
      puts
      puts "You WIN, the Dealer had #{dealer_score}, You had #{player_score}"
      @player.number_of_wins += 1 
      puts
      play_again
    end

  end

  def dealer_move

    until dealer_score >= 16

      @dealer.dhit(@bjdeck.deckk)

    end

    puts
    puts "Dealer hand is "
    puts

    @dealer.hand.each do |card|

      puts "#{card.face} of #{card.suit},"

    end

    dealer_check_for_bust

    player_to_dealer_compare

  end

  def self.first_Dialog

    puts "Do you want to play BlackJack? (y or n)"
    playanswer = gets.chomp.downcase
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
          exit
      end

  end

  def player_score

    @player.hand.inject(0){ |sum, hand_elements| sum + hand_elements.value }

  end

  def dealer_score

    @dealer.hand.inject(0){ |sum, hand_elements| sum + hand_elements.value }

  end

  def check_for_aces

    @player.hand.each do |card|
      if card.face == "A"
        puts "You have an Ace, do you want it to have value 1 or 11"
        card.value = gets.to_i
        puts "you have selected, #{card.value}"
      end
    end

  end

  def number_of_cards_in_deck

    puts "There are #{bjdeck.deckk.length} cards left in the deck"

  end

  def deal

    puts "This is your #{@@number_of_games_played}th game played"
    puts "You have #{@player.number_of_wins} wins"
    puts "You have #{@player.number_of_losses} losses"


    @player.hand = [@bjdeck.deckk.shift]
    @dealer.hand = [@bjdeck.deckk.shift]
    @player.hand << @bjdeck.deckk.shift
    @dealer.hand << @bjdeck.deckk.shift

    number_of_cards_in_deck

    check_for_aces

    puts
    puts "#{@player.name}, You have"
    puts
    puts "#{@player.hand[0].face} of #{@player.hand[0].suit},"
    puts "#{@player.hand[1].face} of #{@player.hand[1].suit}"
    puts
    puts "Your total is #{player_score} "
    puts
    puts "Dealer is showing #{@dealer.hand[0].face} of #{@dealer.hand[0].suit}"
    puts

  end

  def play

    if @@number_of_games_played == 0
      ask_name
    end
    iterate_games
    check_number_of_cards_in_deck
    deal
    check_for_blackjack_player
    check_for_blackjack_dealer
    player_check_for_bust
    player_move

  end

  def check_number_of_cards_in_deck

    if bjdeck.deckk.length < 4
      puts "the deck needs to be shuffled!"
      @bjdeck = Deck.new
    end

  end

  def ask_name

    puts "What is your name?\n"
    @player.name = gets.chomp.capitalize!
    puts
  
  end

  def iterate_games
    @@number_of_games_played += 1
  end


end

Game.first_Dialog
