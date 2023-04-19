# frozen_string_literal: true

%w[board player game display ai].each { |lib| require_relative lib }

intro = "Welcome to Mastermind!

Mastermind is a code-breaking game for two players.

In this version it's you against the computer.

You get 12 attempts to guess the code set by the code-maker.\n\n

Enter your guess - 1🟦 2🟨 3🟥 4🟪 5🟧
    "

# Good luck!! You'll need it... The computer is good!

# Would you like to create the code to be guessed by the computer or guess the computers code (please enter 'create' or 'guess')

puts intro
Game.new
