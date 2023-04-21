# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'display'
require_relative 'ai'

# game class
class Game
  attr_accessor :code, :round_num, :mode, :player

  def initialize
    # @code = ["1", "1", "4", "4"]
    @player = ""
    @code = []
    @round_num = 1
    Game.intro
    play
  end

  def play
    gamemode
    if @mode == 1
      loop do
        guess = @player.get_guess
        until guess.length == 4
          puts "Code has four colors"
          guess = player.get_guess
        end
        print "Round #{"%02d" % round_num} - "
        @round_num += 1
        Display.display_guess(player.guess)
        check_guess(player.guess)
      end
    elsif @mode == 2
      @player.get_possible_codes
      loop do
        sleep(1.7)
        @player.generate_guess(self)
        print "Round #{"%02d" % round_num} - "
        @round_num += 1
        Display.display_guess(player.guess)
        check_guess(player.guess)
      end
    end
  end

  def self.intro
    Display.clear_screen
    puts "Welcome to Mastermind!\n\n"
    puts "Mastermind is a code-breaking game for two players.\n\n"
    puts "In this version it's you against the computer.\n\n"
    puts "You get 12 attempts to guess the code set by the code-maker.\n\n"
    puts "🟢 - correct colors in the correct positions\n"
    puts "⚪️ - correct colors in the wrong positions\n\n"

    puts "Enter your guess - 1🟦 2🟨 3🟥 4🟪 5🟧\n\n"
  end

  def self.computer_intro
    Display.clear_screen
    puts "Welcome to Mastermind!\n\n"
    puts "Mastermind is a code-breaking game for two players.\n\n"
    puts "In this version it's you against the computer.\n\n"
    puts "You get 12 attempts to guess the code set by the code-maker.\n\n"
    puts "🟢 - correct colors in the correct positions\n"
    puts "⚪️ - correct colors in the wrong positions\n\n"
  end

  def gamemode
    puts "Please select gameplay mode:
    1 - Code-breaker
    2 - Code-maker"
    mode = gets.chomp
    until mode == "1" or mode == "2"
      Display.clear_screen
      Game.intro
      gamemode
    end
    if mode == '1'
      @mode = 1
      @player = Player.new('Human')
      AI.generate_code(self)
      Display.clear_screen
      Game.intro
    elsif mode == '2'
      @mode = 2
      @player = Player.new('Computer')
      @player.get_code(self)
      Display.clear_screen
      Game.computer_intro
      Display.display_code(@code)
    else
      clear_screen
      puts 'Invalid selection'
      choose_opponent_type
    end
      #make it clear screen to reprint intro but not show prompt for game-mode or choice
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
      exit
    elsif @round_num > 12
      puts "You lose! 😜"
      print "\n\n"
      Display.display_code(@code)
      exit 
    end
  end

end