#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! Original pattern has been modified for me =)"			
end

get '/new' do
  erb :new
end