# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'ai'

# game class
class Game
  attr_accessor :code

  def initialize
    @code = ["1", "4", "4", "4"]
    play
  end

  def play
    player = Player.new('Kyle')
    # generate_code
    # lets get this working with a known code first
    player.get_guess
    check_guess(player.guess)
  end

  def gamemode
    # single player (codebreaker/codecracker), two-player?
  end

  def check_guess(guess)
    puts "You got #{correct_position?(guess)} exactly right!"
    puts "#{correct_color?(@code, guess).to_i - correct_position?(guess).to_i} have the right color"
  end

  def correct_position?(guess)
    correct = 0
    @code.each_with_index do |v, i|
      if v == guess[i]
        correct += 1
      end
    end
    correct
  end

  def correct_color?(guess)
    #how many have the correct color but aren't already in the correct spot?
  end

  def game_over?
  end

end

'Enter your guess: 1🟦 2🟨 3🟥 4🟪 5🟧'


"Welcome to Mastermind!

Mastermind is a code-breaking game for two players.

In this version it's you against the computer - you get to choose whether to be
code-breaker or code-maker.

The code-breaker gets 12 attempts to guess the code set by the code-maker.

Good luck!! You'll need it... The computer is good!

Would you like to create the code to be guessed by the computer or guess the computers code (please enter 'create' or 'guess')"