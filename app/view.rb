# frozen_string_literal: true

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
  end

  def get_user_input
    puts 'Enter Your Guess'
    gets.chomp.upcase
  end

  def print_round_winner(winner)
    puts "\t the winner is #{winner}"
  end

  def invalid_entry
    puts 'invalid entry'
  end
end
