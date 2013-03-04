require 'sinatra'
$:.unshift(File.expand_path("../lib/", __FILE__))
require 'tictactoe.rb'

class WebTicTacToe < Sinatra::Base
  #set :port, $PORT
  use Rack::Session::Pool

  get '/' do
    session[:confirmed] = true
    erb :index
  end

  get '/game' do
    redirect '/' if session[:confirmed] != true || session[:player1] == nil
    session[:game] ||= Game.new($stdout, [1,2,3,4,5,6,7,8,9], $stdin, session[:player1], session[:player2])
    @game = session[:game]
    @current_player = @game.current_player
    session[:board] ||=  @game.board
    @board = session[:board]
    @spots = []
    @spots << @board.get_rows[0] << @board.get_rows[1] << @board.get_rows[2]
    erb :game
  end

  post '/make_move' do
    redirect '/' if session[:confirmed] != true || session[:player1] == nil
    game = session[:game]
    current_player = game.current_player
    board = session[:board]
    if current_player.player_type.class == Computer
      redirect '/computer_move'
      board.place_move(game.get_player_move, current_player.mark)
    else
      board.place_move(params["chosen-move"].to_i, current_player.mark)
    end
    session[:winner] = current_player if game.scorer.is_won?(board)
    game.cycle_players
    new_current_player = game.current_player
    if new_current_player.player_type.class == Computer
      redirect '/computer_move' unless game.is_over?
    end
    redirect '/game'
  end

  get '/computer_move' do
    redirect '/' if session[:confirmed] != true || session[:player1] == nil
    game = session[:game]
    current_player = game.current_player
    board = session[:board]
    board.place_move(game.get_player_move, current_player.mark)
    game.cycle_players
    new_current_player = game.current_player
    if new_current_player.player_type.class == Computer
      redirect '/computer_move' unless game.is_over?
    end
    session[:winner] = current_player if game.scorer.is_won?(board)
    redirect '/game'
  end

  get '/play_again' do
    redirect '/' if session[:confirmed] != true || session[:player1] == nil
    player1, player2 = session[:player1], session[:player2]
    session.clear
    session[:player1], session[:player2] = player1, player2
    session[:confirmed] = true
    redirect '/game'
  end

  get '/reset_session' do
    session.clear
    redirect '/'
  end

  post '/game_setup' do
    if params["setup"] == "Humans"
      session[:player1] = Player.new(Human.new)
      session[:player2] = Player.new(Human.new)     
    else
      session[:player1] = Player.new(Human.new)
      session[:player2] = Player.new(Computer.new("O"))
    end
    redirect '/game'
  end

end

WebTicTacToe.run!