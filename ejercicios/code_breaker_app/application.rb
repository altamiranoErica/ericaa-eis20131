require 'sinatra/base'
require './models/code_breaker_model.rb'

class MyApplication < Sinatra::Base

   enable :sessions

   get '/code_breaker' do
      erb :code_breaker
   end

   get '/add_word' do
      word = params[:word]
      session[:code_breaker_m] = CodeBreakerModel.new(word, 3)

      redirect '/guess'
   end

   get '/guess' do
      code_breaker_m = session[:code_breaker_m]
      @message = code_breaker_m.message()
      @status_word = code_breaker_m.word_status
      
      erb :guess
   end

   post '/guess' do
      letter = params[:letter]
      code_breaker_m = session[:code_breaker_m]
      @message = code_breaker_m.guess(letter)
      
      redirect '/guess'
   end


end
