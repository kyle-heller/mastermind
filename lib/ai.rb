# frozen_string_literal: true

# AI Module
class AI
  attr_accessor :consistent_codes, :used_guesses, :guess_count, :guess

  def initialize 
    @possible_codes = get_possible_codes
    @consistent_codes = @possible_codes.clone
    @used_guesses = []
    @guess_count = 0
    @guess = []
  end

  def get_possible_codes
    possible_codes = []
    (1..5).each do |a|
      (1..5).each do |b|
        (1..5).each do |c|
          (1..5).each do |d|
            possible_codes << ["#{a}", "#{b}", "#{c}", "#{d}"]
          end
        end
      end
    end
    possible_codes
  end

  def self.generate_code(game)
    4.times { game.code << rand(1..4).to_s }
  end

  def generate_guess(game)
    available_guesses = @consistent_codes - @used_guesses
    if available_guesses.empty?
      puts "No consistent guesses remaining!"
    end
    if guess_count % 3 == 0
      @guess = available_guesses.sample.shuffle # shuffle the guess every third turn
    else
      @guess = available_guesses.sample
    end
    used_guesses << @guess
    @guess_count += 1
    reduce_guesses(game)
    @guess
  end

  def reduce_guesses(game)
    correct_digits = []
    game.code.each_with_index do |v, i|
      if v == @guess[i]
        correct_digits << v
      else
        correct_digits << 0
      end
    end
    @consistent_codes = []
    @possible_codes.each do |possible_code|
      match = true
      possible_code.each_with_index do |v, i|
        if v != @guess[i] && correct_digits[i] != 0
          match = false
          break
        end
      end
      if match
        @consistent_codes << possible_code
      end
    end
    @consistent_codes -= used_guesses
  end
end
