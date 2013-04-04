class Fibonacci

   def tiene_raiz_cuadrada_perfecta(un_numero)
      raiz = Math.sqrt(un_numero)
      raiz.round == raiz
   end
   def es_de_fibonacci(un_numero)
      raiz1 = 5 * un_numero**2 - 4
      raiz2 = 5 * un_numero**2 + 4
      self.tiene_raiz_cuadrada_perfecta(raiz1) || self.tiene_raiz_cuadrada_perfecta(raiz2)  
   end
end

