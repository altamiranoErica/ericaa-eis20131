class CodeBreaker

   def initialize(code, life = 5)
      @code = code
      @life = life
      @letters = Array.new
      @finished_state = false
   end
    
   def life
      @life
   end

   def letters
      @letters
   end
   
   def guess(letter)
      if(! @finished_state)
         self.result_of_guess(letter)
      else
         return "Game over. Start a new game."
      end
   end

   def result_of_guess(letter)
      message = self.evaluate_guess(letter)
      if(self.completed_word?)
         message = "You won! " + self.word_and_change_state
      elsif(self.life == 0)
         message = "Game over! " + self.word_and_change_state 
      end
      return message
   end

   def evaluate_guess(letter)
      @letters = @letters.push(letter)
      if(@code.include?(letter))
         return self.state_word
      else
         @life -=1   
         return "The letter is not in the word"
     end
     
   end

   def word_and_change_state()
      @finished_state = true 
      return "The word is '#{@code}'"
   end

   def completed_word?()
      return @code.eql?(self.state_word)
   end

   def state_letter(letter)
       if (! @letters.include?(letter))
         return "_" 
       else
         return letter
       end
   end
    
   def state_word()
      state = ""
      @code.each_char do |letter|
          state = state + self.state_letter(letter)
      end
      return state
   end
       
end