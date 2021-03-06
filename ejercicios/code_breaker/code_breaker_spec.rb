require 'rspec'
require_relative './code_breaker'
require_relative './code_breaker_exception'


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

     it 'should return False when fail' do

       code_breaker = CodeBreaker.new('home')

       code_breaker.evaluate_guess('a').should be_false

     end

   end

   describe 'evaluate_guess' do

     it 'should return True when guesses the "o"' do
 
       code_breaker = CodeBreaker.new('home')

       code_breaker.evaluate_guess('o').should be_true

     end

   end

   describe 'letter_status' do

     it 'should return * when the array is empty ' do

       code_breaker = CodeBreaker.new('home')

       code_breaker.letter_status('c').should eq "*"

     end

   end  

   describe 'letter_status' do

     it 'should return "o" when the array contains "o" ' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('o')

       code_breaker.letter_status('o').should eq "o"
 
     end

   end  

   describe 'word_status' do

     it 'should return "****" when the array is empty ' do

       code_breaker = CodeBreaker.new('home')

       code_breaker.word_status.should eq "****"
 
     end

   end 

   describe 'word_status' do

     it 'should return "****" when the array not contains letters of the word' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('a')
       code_breaker.evaluate_guess('b')

       code_breaker.word_status.should eq "****"
 
     end

   end

   describe 'word_status' do

     it 'should return "*om*" when the array contains "o" and "m" ' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('o')
       code_breaker.evaluate_guess('m')

       code_breaker.word_status.should eq "*om*"
 
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

   describe 'is_finished?' do

     it 'should return true when you win' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('h')
       code_breaker.evaluate_guess('o')
       code_breaker.evaluate_guess('m')
       code_breaker.evaluate_guess('e')

       code_breaker.is_finished?.should be_true
 
     end

   end

   describe 'is_finished?' do

     it 'should return true when you lose' do

       code_breaker = CodeBreaker.new('home', 1)
       code_breaker.evaluate_guess('c')

       code_breaker.is_finished?.should be_true
 
     end

   end

   describe 'guess' do

     it 'should throw exception when playing after you win' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.guess('h')
       code_breaker.guess('o')
       code_breaker.guess('m')
       code_breaker.guess('e')
 
       expect { code_breaker.guess('k') }.to raise_exception(FinishedGameException)
 
     end
   end

   describe 'guess' do

     it 'should throw exception when playing after you lose' do

       code_breaker = CodeBreaker.new('home', 1)
       code_breaker.guess('c')
 
       expect { code_breaker.guess('k') }.to raise_exception(FinishedGameException)
 
     end
   end
   
   

end
