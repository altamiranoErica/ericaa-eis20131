require_relative './code_breaker_exception.rb'

class CodeBreaker

   def initialize(code, life = 5)
      @code = code
      @life = life
      @letters = Array.new
      @finished_status = false
   end
    
   def code
      @code
   end
   
   def life
      @life
   end

   def letters
      @letters
   end
   
   def guess(letter)
      if(! self.is_finished?)
         self.evaluate_guess(letter)
      else
         raise FinishedGameException
      end
   end

   def evaluate_guess(letter)
      @letters = @letters.push(letter)
      include_letter = @code.include? letter
      if(! include_letter)
         @life -= 1  
      end   
      return include_letter
   end

   def is_finished?()
      self.completed_word? || @life == 0
   end

   def completed_word?()
      return @code.eql?(self.word_status)
   end

   def letter_status(letter)
       if (! @letters.include?(letter))
         return "*" 
       else
         return letter
       end
   end
    
   def word_status()
      status = ""
      @code.each_char do |letter|
          status = status + self.letter_status(letter)
      end
      return status
   end
      
end
