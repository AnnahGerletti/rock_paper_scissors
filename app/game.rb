class Game
  attr_reader :rounds, :computer_win, :user_win
  def initialize(rounds: 3)
    @rounds = rounds
    @computer_win = 0
    @user_win = 0
  end

  def over?
    @computer_win > @rounds/2 || @user_win > @rounds/2
  end

  def round_number
   @computer_win + @user_win + 1
  end
  

  def take_turn(computer_input, user_input)


    #TODO 4 maybe move selection of random letter out
    # to its own class to make it easy to substitute in a mock for testing purposes. Get the controller to pass computer's choice to this method (take_turn(user_input, computer_input))
    #DONE


    result_of_turn = winner_of(computer_input, user_input)

    #TODO 3 change something about the game based on result_of_turn - number of rounds computer and user have won BY CALLING who_won_the_round
    #DONE
    #TODO 3.5 spec take_turn
    #DONE
    #ToDO 3.6 spec the other simple methods
    #DONE
   updates_game_score(result_of_turn)
  end

  def winner_of(computer, user)
    #TODO 6 this method is not pretty. Magic strings bad. Too complex bad.
    
    #TODO 5 and move it in to its own class, maybe
      if computer == user 
        return 'no_one'
      end

      if  (computer == 'R' && user == 'S') ||
          (computer == 'S' && user == 'P') ||
          (computer == 'P' && user == 'R')
        return 'computer'
      end

       return 'user'
  end
  
  def updates_game_score(result_of_turn)
    
    #TODO 2.5 get some tests over it
    #DONE
    if result_of_turn == 'computer'
      @computer_win = @computer_win + 1
    elsif result_of_turn == 'user'
      @user_win = @user_win + 1 
    end
      
  end
  

    
end 