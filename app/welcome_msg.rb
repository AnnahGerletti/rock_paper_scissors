class WelcomeMsg
  attr_reader :design, :hi_msg, :rules
  def initialize
    @design = '=============================='
    @hi_msg = 'Welcome to Rock, Paper, Scissors'
    @rules = ['- Best of 3 rounds', '- Rock, Paper, Scissors rules apply', '- Press R for rock', '- Press P for Paper', '- and S for scissors', 'Lets Begin']
  end
end
