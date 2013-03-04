$:.unshift File.expand_path("../", __FILE__)
require './webttt'
require 'rubygems'
require 'sinatra'
run Sinatra::Application