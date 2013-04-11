require 'rspec'
require './code_breaker'

describe CodeBreaker do

   describe 'evaluate_guess' do

     it 'should decrement life when fail' do

       code_breaker = CodeBreaker.new('home')
       initial_life = code_breaker.life
       code_breaker.evaluate_guess('c')
       code_breaker.life.should eq initial_life-1

     end

   end

   describe 'evaluate_guess' do

     it 'should not decrement life when successful' do

       code_breaker = CodeBreaker.new('home')
       initial_life = code_breaker.life
       code_breaker.evaluate_guess('h')
       code_breaker.life.should eq initial_life

     end

   end

   describe 'evaluate_guess' do

     it 'should insert the letter in the array' do

       code_breaker = CodeBreaker.new('home')
       initial_array = code_breaker.letters
       code_breaker.evaluate_guess('h')
       initial_array = initial_array.push('h')
       code_breaker.letters.should eq initial_array

     end

   end

   describe 'evaluate_guess' do

     it 'should return "The letter is not in the word" when fail' do

       code_breaker = CodeBreaker.new('home')
       _return = code_breaker.evaluate_guess('a')
       _return.should eq "The letter is not in the word"

     end

   end

   describe 'evaluate_guess' do

     it 'should return "_o__" when successful' do
 
       code_breaker = CodeBreaker.new('home')
       _return = code_breaker.evaluate_guess('o')
       _return.should eq "_o__"

     end

   end

   describe 'state_letter' do

     it 'should return "_" when the array is empty ' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.state_letter('c').should eq "_"

     end

   end  

   describe 'state_letter' do

     it 'should return "____" when the array is empty ' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('o')
       code_breaker.state_letter('o').should eq "o"
 
     end

   end  

   describe 'state_word' do

     it 'should return "____" when the array is empty ' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.state_word.should eq "____"
 
     end

   end 

   describe 'state_word' do

     it 'should return "____" when no letters of the word in the array ' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('a')
       code_breaker.evaluate_guess('b')
       code_breaker.state_word.should eq "____"
 
     end

   end

   describe 'state_word' do

     it 'should return "_om_" when "o" and "m" are in the array ' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('o')
       code_breaker.evaluate_guess('m')
       code_breaker.state_word.should eq "_om_"
 
     end

   end 

   describe 'completed_word?' do

     it 'should return true when the array contains "h", "o", "m" and "e" ' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('h')
       code_breaker.evaluate_guess('o')
       code_breaker.evaluate_guess('m')
       code_breaker.evaluate_guess('e')
       code_breaker.completed_word?.should be_true
 
     end

   end

   describe 'completed_word?' do

     it 'should return false when the array does not contain "h", "o", "m" or "e" ' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('h')
       code_breaker.evaluate_guess('o')
       code_breaker.evaluate_guess('a')
       code_breaker.completed_word?.should be_false
 
     end

   end
   

end
