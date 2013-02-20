require 'sinatra'
$:.unshift(File.expand_path("../lib/", __FILE__))
require 'tictactoe.rb'


use Rack::Session::Pool

get '/' do
  session[:name] ||= "Andrew"
  erb :index
end


get '/game' do
  @name = session[:name]
  session[:board] ||=  Board.new([1,2,3,4,5,6,7,8,9], STDOUT)
  @board = session[:board]
  @positions = @board.positions
  erb :game
end
