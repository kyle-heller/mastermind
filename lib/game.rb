# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'display'
require_relative 'ai'

# game class
class Game
  attr_accessor :code, :round_num

  def initialize
    # @code = ["1", "1", "4", "4"]
    @code = []
    @round_num = 1
    play
  end

  def play
    player = Player.new('Kyle')
    # generate_code
    # lets get this working with a known code first
    AI.generate_code(self)
    puts Board.default_board
    loop do
      guess = player.get_guess
      until guess.length == 4
        puts "Code has four colors"
        guess = player.get_guess
      end
      print "Round #{"%02d" % round_num} - "
      @round_num += 1
      Display.display_guess(player.guess)
      check_guess(player.guess)
    end
  end

  def gamemode
    # single player (codebreaker/codecracker), two-player?
  end

  def check_guess(guess)
    exact_matches(guess).to_i.times { print "🟢" }
    inexact_matches(guess).times { print "⚪️" }
    wrong_marker(guess).times { print "⚫️" }
    puts "\n"
    game_over?(guess)
  end

  def exact_matches(guess)
    correct = 0
    @code.each_with_index do |v, i|
      if v == guess[i]
        correct += 1
      end
    end
    correct
  end

  def inexact_matches(guess)
    inexact_matches_var = 0
    code_counts = Hash.new(0)
    @code.each do |value|
      code_counts[value] += 1
    end
    guess.each do |value|
      if code_counts[value] > 0
        code_counts[value] -= 1
        inexact_matches_var += 1
      end
    end
    inexact_matches_var - exact_matches(guess)
  end

  def wrong_marker(guess)
    4 - inexact_matches(guess) - exact_matches(guess)
  end

  def game_over?(guess)
    if @code == guess
      puts "You Win!"
    elsif @round_num > 12
      puts "You lose! 😜"
      exit 
    end
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