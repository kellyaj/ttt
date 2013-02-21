require 'sinatra'
$:.unshift(File.expand_path("../lib/", __FILE__))
require 'tictactoe.rb'

class WebTicTacToe < Sinatra::Base

  use Rack::Session::Pool

  get '/' do
    erb :index
  end


  get '/game' do
    session[:board] ||=  Board.new([1,2,3,4,5,6,7,8,9], STDOUT)
    @board = session[:board]
    @positions = @board.positions
    erb :game
  end

  get '/make_move' do
    redirect '/game'
  end
end

WebTicTacToe.run!
