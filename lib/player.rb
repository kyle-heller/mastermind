# frozen_string_literal: true
require 'io/console'
require_relative 'display'
require 'pry-byebug'

# player class
class Player
  attr_accessor :guess, :possible_guesses

  def initialize(name)
    @name = name
    @guess = []
    @possible_guesses = []
  end

  def get_possible_codes
    possible_codes = []
    (1..5).each do |a|
      (1..5).each do |b|
        (1..5).each do |c|
          (1..5).each do |d|
            possible_codes << "#{a}#{b}#{c}#{d}"
          end
        end
      end
    end
    @possible_guesses = possible_codes
  end

  def get_guess
    print "Guess: "
    @guess = gets.chomp.chars
    # @guess = STDIN.noecho(&:gets).chomp.chars
  end

  def generate_guess(game)
    @guess = @possible_guesses.sample.split("")
    reduce_possible_guesses(game.code)
    @guess
  end

  def reduce_possible_guesses(code)
    @possible_guesses = @possible_guesses.sample(@possible_guesses.count / 1.5)
    @possible_guesses << code.join("")
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
      game.code = guess.split("")
  end
end
