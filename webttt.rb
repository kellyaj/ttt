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
    # what should I be putting for the I/O here? I guess it doesnt matter at this point
    session[:game] ||= Game.new($stdout, [1,2,3,4,5,6,7,8,9], $stdin, session[:player1], session[:player2])
    @game = session[:game]
    @current_player = @game.current_player
    session[:board] ||=  @game.board
    @board = session[:board]
    @spots = @board.positions
    erb :game
  end

  get '/make_move' do
    game = session[:game]
    current_player = game.current_player
    board = session[:board]
    if current_player.player_type.class == Computer
      board.place_move(game.get_player_move, current_player.mark)
    else
      board.place_move(session[:human_move].to_i, current_player.mark)
    end
    game.cycle_players
    redirect '/game'
  end

  get '/play_again' do
    player1, player2 = session[:player1], session[:player2]
    session.clear
    session[:player1], session[:player2] = player1, player2
    redirect '/game'
  end

  get '/reset_session' do
    session.clear
    redirect '/'
  end

  get '/make_move/:human_move' do
    session[:human_move] = params[:human_move]
    redirect '/make_move'
  end

  get '/cvc' do
    session[:player1] = Player.new(Computer.new("X"))
    session[:player2] = Player.new(Computer.new("O"))
    redirect '/game'
  end

  get '/hvh' do
    session[:player1] = Player.new(Human.new)
    session[:player2] = Player.new(Human.new)
    redirect '/game'
  end

  get '/hvc' do
    session[:player1] = Player.new(Human.new)
    session[:player2] = Player.new(Computer.new("O"))
    redirect '/game'
  end
end

WebTicTacToe.run!
