# frozen_string_literal: true
require 'io/console'
require_relative 'display'

# The Player class represents a player in a game. It has an instance variable for storing the player's guess and an instance variable for storing the list of possible guesses. The class has methods for getting the player's guess and for getting the code for the game. The get_guess method prompts the player to input their guess, and the get_code method prompts the player to input the code for the game, which consists of four colors.
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
