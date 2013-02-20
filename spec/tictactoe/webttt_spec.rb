require 'spec_helper'
require 'webttt'
require 'rack/test'

set :environment, :test

describe "WebTTT" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context "the index page" do
    it "should get the index" do
      get '/'
      last_response.should be_ok
      last_response.body.should include("Welcome to Tic-Tac-Toe!")
    end
  end

  context "the game page" do
    it "should get the game page" do
      get '/game'
      last_response.should be_ok
      last_response.body.should include("Don't hate the player, hate the game")
    end

    it "should be able to access a board object on the game page" do
      get '/game'
      last_response.should be_ok
      last_response.body.should include("[1, 2, 3, 4, 5, 6, 7, 8, 9]")
    end
  end
end
