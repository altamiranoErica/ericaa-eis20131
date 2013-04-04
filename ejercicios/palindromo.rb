class Palindromo
   def es_palindromo(un_string)
      string_sin_espacios_en_mayusculas = un_string.upcase.split.join
      string_sin_espacios_en_mayusculas == string_sin_espacios_en_mayusculas.reverse
   end
end

