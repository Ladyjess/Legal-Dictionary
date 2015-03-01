require 'sinatra'
require 'sinatra/reloader'
also_reload './lib/**/*.rb'
require './lib/word.rb'
require './lib/definition.rb'
require 'pry'

get '/' do
  @words = Word.all
  erb :index
end

post '/word' do
  @vocabulary = params["vocabulary"]
  @word = Word.new({ :vocabulary => @vocabulary }).save
  @words = Word.all
  redirect '/'
end

get '/word/:id' do
  @word = Word.find(params["id"].to_i)
  @some_definitions = @word.definitions
  erb :definition
end

post '/definition' do
  @word_definition = params["word_definition"]
  @new_definition = Definition.new({:word_definition => @word_definition}).save
  @word = Word.find(params["id"].to_i)
  @word.add_definition(@new_definition)
  @some_definitions = Definition.all
  redirect '/'
end
