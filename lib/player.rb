# frozen_string_literal: true
require 'io/console'
require_relative 'display'

# player class
class Player
  attr_accessor :guess, :possible_guesses

  def initialize(name)
    @name = name
    @guess = []
    @possible_guesses = []
  end

  def get_guess
    print 'Guess: '
    @guess = gets.chomp.chars
    # @guess = STDIN.noecho(&:gets).chomp.chars
  end

  def get_code(game)
    Display.clear_screen
    puts "Enter 4 color code - 1🟦 2🟨 3🟥 4🟪 5🟧\n\n"
    guess = gets.chomp
      until guess.length == 4
        # binding.pry
        puts "Code has four colors"
        guess = gets.chomp
      end
    game.code = guess.split('')
  end
end
