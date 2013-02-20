require 'sinatra'
$:.unshift(File.expand_path("../lib/", __FILE__))
require 'tictactoe.rb'

get '/' do
  erb :index
end


get '/game' do
  @board = Board.new([1,2,3,4,5,6,7,8,9], STDOUT)
  erb :game
end
