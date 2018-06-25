
require 'byebug'
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
    result_of_turn = winner_of(computer_input, user_input)
    updates_game_score(result_of_turn)
  end

  def winner_of(computer, user)

    #TODO 6 this method is not pretty. Magic strings bad. Too complex bad.
    
    #TODO 5 and move it in to its own class, maybe
    if computer == user 
      return "tie"
    end

    if (computer == 'R' && user == 'S') ||
       (computer == 'S' && user == 'P') ||
       (computer == 'P' && user == 'R')
      return "computer"
    end

    return "user"
  end
  
  def updates_game_score(result_of_turn)
    if result_of_turn == 'computer'
      @computer_win = @computer_win + 1
    elsif result_of_turn == 'user'
      @user_win = @user_win + 1 
    end
  end

  def valid_move?(move)
   /\A^[R,S,P]$+\z/.match?(move)
  end 

  def show_round_winner(computer_guess, user_guess)
    # byebug
    round_winner = winner_of(computer_guess, user_guess)
      "Winner of the round: #{round_winner}"
  end
end 