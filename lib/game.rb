# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'display'
require_relative 'ai'

# game class
class Game
  attr_accessor :code, :round_num, :mode, :player

  def initialize
    @player = ""
    @computer = ""
    @code = []
    @round_num = 1
    Board.intro
    play
  end

  def play
    gamemode
    @mode == 1 ? play_human_game : play_computer_game
  end

  def play_human_game
    loop do
      guess = @player.get_guess
      until guess.length == 4
        puts 'Code has four colors'
        guess = player.get_guess
      end
      print "Round #{"%02d" % round_num} - "
      @round_num += 1
      Display.display_guess(player.guess)
      check_guess(player.guess)
    end
  end

  def play_computer_game
    loop do
      sleep(1.7)
      @computer.generate_guess(self)
      print "Round #{"%02d" % round_num} - "
      @round_num += 1
      Display.display_guess(@computer.guess)
      check_guess(@computer.guess)
      @computer.reduce_guesses(self)
    end
  end

  def gamemode
    Board.select_mode_text
    mode = gets.chomp
    until mode == "1" or mode == "2"
      Display.clear_screen
      Board.intro
      gamemode
    end
    if mode == '1'
      @mode = 1
      @player = Player.new('Codebreaker')
      AI.generate_code(self)
      Display.clear_screen
      Board.intro
    elsif mode == '2'
      @mode = 2
      @player = Player.new('Codemaker')
      @player.get_code(self)
      @computer = AI.new
      Display.clear_screen
      Board.computer_intro
      Display.display_code(@code)
    end
  end

  def check_guess(guess)
    exact_matches(guess).times { print "🟢" }
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
      if code_counts[value].positive?
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
      puts @mode == 1 ? 'You Win!' : 'You lose! 😜'
      play_again?
    elsif @round_num > 12
      puts @mode == 1 ? 'You lose! 😜' : 'You Win!'
      print "\n\n"
      Display.display_code(@code)
      play_again?
    end
  end

  def play_again?
    puts 'Play again? (yes/no)'
    response = gets.chomp.downcase
    if %w[yes y].include?(response)
      Game.new
      true
    else
      exit
    end
  end

end
