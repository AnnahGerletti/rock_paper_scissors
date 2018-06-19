
class View 
  def initialize(setup_msg)
    @setup_msg = setup_msg
  end
  def welcome
    puts @setup_msg.design
    puts @setup_msg.hi_msg
    puts @setup_msg.rules
    puts @setup_msg.design
  end

  def round(round)
    puts "Round #{round}"
    #TODO why do upper case letters play more rounds
  end

  # def start_game?
  #   puts 'press a letter to '
  #   gets.chomp 
  # end

  def get_user_input
    puts "Enter Your Guess"
    gets.chomp
  end

  def print_computers_guess
    puts
    #TODO pass in computers guess after user has entered there's, decide if I should inject the compt guess class to view class or pass it in through the controller
  end

  def print_round_winner(winner)
    puts "the winner is #{winner}"
  end
end



