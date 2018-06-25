# frozen_string_literal: true
require "byebug"
class Controller
  def initialize(view, game, computer_guess)
    @view = view
    @game = game
    @computer_guess = computer_guess
  end

  def start
    @view.welcome

    game_loop until @game.over?
    @view.champion(@game.game_winner)
  end

  def game_loop
    puts @view.round(@game.round_number)
    computer_guess = @computer_guess.computer_input
    user_guess = get_playable_user_guess

    # TODO: does the line below belong here

    puts "\t computer guessed #{computer_guess}"
  
    @game.take_turn(computer_guess, user_guess)

    puts @game.show_round_winner(computer_guess, user_guess)
  end

  def get_playable_user_guess
    loop do
      input = @view.get_user_input
      if @game.valid_move?(input)
        return input
      else
        @view.invalid_entry
      end
    end
    # TODO: cover with specs
    # Todo: refactor
  end
end
