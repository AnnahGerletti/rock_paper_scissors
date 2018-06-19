require_relative './welcome_msg'
require_relative './view'
require_relative './controller'
require_relative './game'
require_relative './computer_guess'

setup_msg = WelcomeMsg.new
view = View.new(setup_msg)
computer_input = ComputerGuess.new
game = Game.new


Controller.new(view, game, computer_input).start