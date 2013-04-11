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

       code_breaker.evaluate_guess('a').should eq "The letter is not in the word"

     end

   end

   describe 'evaluate_guess' do

     it 'should return "_o__" when guesses the "o"' do
 
       code_breaker = CodeBreaker.new('home')

       code_breaker.evaluate_guess('o').should eq "_o__"

     end

   end

   describe 'state_letter' do

     it 'should return "_" when the array is empty ' do

       code_breaker = CodeBreaker.new('home')

       code_breaker.state_letter('c').should eq "_"

     end

   end  

   describe 'state_letter' do

     it 'should return "o" when the array contains "o" ' do

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

     it 'should return "____" when the array not contains letters of the word' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('a')
       code_breaker.evaluate_guess('b')

       code_breaker.state_word.should eq "____"
 
     end

   end

   describe 'state_word' do

     it 'should return "_om_" when the array contains "o" and "m" ' do

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

   describe 'result_of_guess' do

     it 'should return "The letter is not in the word" when fail and has lives' do

       code_breaker = CodeBreaker.new('home')

       code_breaker.result_of_guess('c').should eq "The letter is not in the word"
 
     end

   end

   describe 'result_of_guess' do

     it 'should return "hom_" when guesses the "m" and the array contains "h" and "o"' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('h')
       code_breaker.evaluate_guess('o')

       code_breaker.result_of_guess('m').should eq "hom_"
 
     end

   end

   describe 'result_of_guess' do

     it 'should return "You won! The word is home" when guesses the "e" and the array contains "h", "o" and "m"' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('h')
       code_breaker.evaluate_guess('o')
       code_breaker.evaluate_guess('m')

       code_breaker.result_of_guess('e').should eq "You won! The word is home"
 
     end

   end

   describe 'result_of_guess' do

     it 'should return "Game over! The word is home" when fail and has not lives' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.evaluate_guess('a')
       code_breaker.evaluate_guess('b')
       code_breaker.evaluate_guess('c')
       code_breaker.evaluate_guess('d')

       code_breaker.result_of_guess('f').should eq "Game over! The word is home"
 
     end

   end

   describe 'result_of_guess' do

     it 'should change the finished_state to true when you lose' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.result_of_guess('a')
       code_breaker.result_of_guess('b')
       code_breaker.result_of_guess('c')
       code_breaker.result_of_guess('d')
       code_breaker.result_of_guess('f')

       code_breaker.finished_state.should be_true
 
     end

   end

   describe 'result_of_guess' do

     it 'should change the finished_state to true when you win' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.result_of_guess('h')
       code_breaker.result_of_guess('o')
       code_breaker.result_of_guess('m')
       code_breaker.result_of_guess('e')

       code_breaker.finished_state.should be_true
 
     end

   end

   describe 'guess' do

     it 'should return "The letter is not in the word" when fail and has lives' do

       code_breaker = CodeBreaker.new('home')

       code_breaker.guess('a').should eq "The letter is not in the word"
 
     end

   end

   describe 'guess' do

     it 'should return "h___" when successful and the word is not guessed' do

       code_breaker = CodeBreaker.new('home')

       code_breaker.guess('h').should eq "h___"
 
     end

   end

   describe 'guess' do

     it 'should return "You won! The word is home" when guesses the last letter of the word' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.guess('h')
       code_breaker.guess('m')
       code_breaker.guess('e')

       code_breaker.guess('o').should eq "You won! The word is home"
 
     end

   end

   describe 'guess' do

     it 'should return "Game over! The word is home" when fail and have not lives' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.guess('a')
       code_breaker.guess('b')
       code_breaker.guess('c')
       code_breaker.guess('d')

       code_breaker.guess('f').should eq "Game over! The word is home"
 
     end

   end

   describe 'guess' do

     it 'should return "Game over. Start a new game." when plays and not has lives' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.guess('a')
       code_breaker.guess('b')
       code_breaker.guess('c')
       code_breaker.guess('d')
       code_breaker.guess('f')

       code_breaker.guess('h').should eq "Game over. Start a new game."
 
     end

   end

   describe 'guess' do

     it 'should return "Game over. Start a new game." when plays and the word is guessed' do

       code_breaker = CodeBreaker.new('home')
       code_breaker.guess('h')
       code_breaker.guess('o')
       code_breaker.guess('m')
       code_breaker.guess('e')

       code_breaker.guess('a').should eq "Game over. Start a new game."
 
     end

   end
   

end
