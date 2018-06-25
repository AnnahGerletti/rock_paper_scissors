# frozen_string_literal: true

require_relative '../app/game.rb'

RSpec.describe Game do
  let(:mock_computer_input) {instance_double('ComputerGuess')}
  let(:game) { Game.new }

  describe '#winner_of' do
    context 'Computer is the winner' do
      it 'wins when it plays rock and user plays scissors' do
        result = game.winner_of('R', 'S')

        expect(result).to eq('computer')
      end

      it 'wins when it plays scissors and user plays paper' do
        result = game.winner_of('S', 'P')

        expect(result).to eq('computer')
      end

      it 'wins when it plays paper and user plays rock' do
        result = game.winner_of('P', 'R')

        expect(result).to eq('computer')
      end
    end

    context 'User is the winner' do
      it 'wins when they play rock and computer plays scissors' do
        result = game.winner_of('S', 'R')

        expect(result).to eq('user')
      end

      it 'wins when they play scissors and computer plays paper' do
        result = game.winner_of('P', 'S')

        expect(result).to eq('user')
      end

      it 'wins when they play paper and computer plays rock' do
        result = game.winner_of('R', 'P')

        expect(result).to eq('user')
      end
    end
    context 'when there is a draw' do
      it 'both computer and user play paper' do
        result = game.winner_of('P', 'P')

        expect(result).to eq('tie')
      end
      it 'both computer and user play rock' do
        result = game.winner_of('R', 'R')

        expect(result).to eq('tie')
      end
      it 'both computer and user play scissors' do
        result = game.winner_of('S', 'S')

        expect(result).to eq('tie')
      end
    end
  end

  describe '#updates_game_score' do
    context 'When computer has won the round' do
      it 'adds one to computer score' do
        game.updates_game_score('computer')

        expect(game.computer_win).to be_positive
      end
    end
    context 'When user has won the round' do
      it 'adds one to user score' do
        game.updates_game_score('user')

        expect(game.user_win).to be_positive
      end
    end
    context 'When there is a draw' do
      it 'neither score is updated' do
        game.updates_game_score('tie')

        expect(game.user_win).to eq 0
        expect(game.computer_win).to eq 0
      end
    end
  end

  describe '#take_turn' do
    it 'determines who won' do
      expect(game).to receive(:winner_of).with('R', 'S').and_call_original

      game.take_turn('R', 'S')
    end
    it 'updates the game score with the result of winner' do
      allow(game).to receive(:winner_of).and_return('test')

      expect(game).to receive(:updates_game_score).with('test')

      game.take_turn('C', 'G')
    end
  end

  describe '#round_number' do
    it 'lets user know what round they are on' do
      game.updates_game_score('user')

      expect(game.round_number).to eq 2
    end
  end

  describe '#over?' do
    context 'when the user has lost twice' do
      it 'the game is over' do
       game.updates_game_score('computer')
       game.updates_game_score('computer')

       expect(game.over?).to be true
      end
    end
    context 'when the user has won twice' do
      it 'the game is over' do
        game.updates_game_score('user')
        game.updates_game_score('user')

        expect(game.over?).to be true
      end
    end
  end

  describe '#valid_move?' do
    context 'when the user has made move' do
      it 'is a valid input' do 
        game.valid_move?('R')

        expect(game.valid_move?('R')).to be true
      end

      it 'is a invalid input' do 
        game.valid_move?('W')

        expect(game.valid_move?('W')).to be false
      end
    end
  end
end
