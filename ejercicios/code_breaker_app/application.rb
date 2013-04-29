require 'sinatra/base'
require '../code_breaker/code_breaker.rb'

class MyApplication < Sinatra::Base

   enable :sessions

   get '/code_breaker' do
      word = params[:word]
      session[:code_breaker] = CodeBreaker.new(word, 3)

      erb :code_breaker
   end

   get '/guess' do
      letter = params[:letter]
      code_breaker = session[:code_breaker]
      @message = code_breaker.guess_and_generate_message(letter)
      @status_word = code_breaker.word_status
      
      erb :guess
   end


end