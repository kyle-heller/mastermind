# frozen_string_literal: true

%w[board player game display ai].each { |lib| require_relative lib }

Game.new
