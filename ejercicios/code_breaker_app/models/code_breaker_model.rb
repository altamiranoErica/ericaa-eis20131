require '../code_breaker/code_breaker.rb'

class CodeBreakerModel

   def initialize (code, life = 5)
      @code_breaker = CodeBreaker.new(code, life)
      @message = ""
   end
   
   def message()
      @message
   end

   def guess(letter)
      begin
         guessed = @code_breaker.guess(letter)
         case
            when @code_breaker.completed_word? then @message = "Juego terminado, ganaste"
            when (@code_breaker.life == 0) then @message = "ups! Juego terminado, perdiste"
            when guessed then @message = "acierto"
            else @message = "ups!"
         end
      rescue
         @message = "Este juego ha finalizado. Comience un nuevo juego"
      end
   end

   def word_status()
      @code_breaker.word_status()
   end  

end
