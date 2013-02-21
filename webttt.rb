require 'pry'
require 'sinatra'
$:.unshift(File.expand_path("../lib/", __FILE__))
require 'tictactoe.rb'

class WebTicTacToe < Sinatra::Base

  use Rack::Session::Pool

  get '/' do
    erb :index
  end


  get '/game' do
    player1 = Player.new(Computer.new("X"))
    player2 = Player.new(Computer.new("O"))
    session[:game] ||= Game.new($stdout, [1,2,3,4,5,6,7,8,9], $stdin, player1, player2)
    @game = session[:game]
    session[:board] ||=  @game.board
    @board = session[:board]
    @spots = @board.positions
    erb :game
  end

  get '/make_move' do
    game = session[:game]
    current_player = game.current_player
    board = session[:board]
    board.place_move(game.get_player_move, current_player.mark)
    game.cycle_players
    redirect '/game'
  end
end

WebTicTacToe.run!
