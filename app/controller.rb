 class Controller 

  def initialize(view, game, computer_guess)
    @view = view
    @game = game
    @computer_guess = computer_guess
  end

  def start 
    @view.welcome

    # start_game = @view.start_game?
    
    until @game.over?
      @view.round(@game.round_number)

      user_input = @view.validate_guess?
      computer_input = @computer_guess.computer_input
      #TODO 7 validate that the user has given us R/P/S (lower priority change)
        #DONE
      puts "#{user_input}"
      #TODO think about putting game logic into a game loop

      @game.take_turn(computer_input, user_input)
      round_winner = @game.winner_of(computer_input, user_input)
      @view.print_round_winner(round_winner)
    end
    #TODO 4 view spit out who won
    #DONE

  end

end