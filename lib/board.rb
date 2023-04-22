# frozen_string_literal: true

# Handles board
class Board
  COLORS_AND_ASSETS = {
    1 => "🟦",
    2 => "🟨",
    3 => "🟥",
    4 => "🟪",
    5 => "🟧",
  }

  def initialize
  end

  def self.colors_and_assets
    COLORS_AND_ASSETS
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

  def self.select_mode_text
    puts "Please select gameplay mode:
    1 - Code-breaker
    2 - Code-maker"
  end

end

