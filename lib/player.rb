# frozen_string_literal: true

# player class
class Player
  attr_accessor :guess

  def initialize(name)
    @name = name
    @guess = []
  end

  def get_guess
    puts 'Enter your guess: 1🟦 2🟨 3🟥 4🟪 5🟧'
    @guess = gets.chomp.chars
  end

end
