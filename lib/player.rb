# frozen_string_literal: true
require 'io/console'

# player class
class Player
  attr_accessor :guess

  def initialize(name)
    @name = name
    @guess = []
  end

  def get_guess
    print "Guess: "
    @guess = gets.chomp.chars
    # @guess = STDIN.noecho(&:gets).chomp.chars
  end
end
