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

post '/words' do
  @word = params[:word]
  Word.new({ :vocabulary => @word }).save
  @words = Word.all
  redirect '/'
end

get '/word/:id' do
  @word = Word.find_word(params[:id].to_i)
  erb :definition
end

post '/word' do
  @word = params[:word]
  @word_definition = params[:word_definition]
  @word_definition = Definition.new(word_definition)
  @word_definition.save
  @word = Word.new({ :vocabulary => @word})
  @word.save
  @word.add_word(word)
  @words = Word.all
  erb :definition
end
