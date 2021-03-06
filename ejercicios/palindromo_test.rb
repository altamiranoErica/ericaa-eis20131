require './palindromo'
require 'test/unit'

class PalindromoTest < Test::Unit::TestCase
   def test_es_palindromo_debe_devolver_true_para_string_que_es_palindromo_con_una_palabra
      palindromo = Palindromo.new
      assert palindromo.es_palindromo("sometemos")
   end

   def test_es_palindromo_debe_devolver_false_para_un_string_que_no_es_palindromo_con_una_palabra
      palindromo = Palindromo.new
      assert !(palindromo.es_palindromo("someterse"))
   end

   def test_es_palindromo_debe_devolver_true_para_un_string_que_es_palindromo_con_varias_palabras_que_usan_mayusculas
      palindromo = Palindromo.new
      assert palindromo.es_palindromo("Acaso Hubo Buhos Aca")
   end

   def test_es_palindromo_debe_devolver_true_para_un_string_que_es_palindromo_con_varias_palabras_que_no_usan_mayusculas
      palindromo = Palindromo.new
      assert palindromo.es_palindromo("acaso hubo buhos aca")
   end

   def test_es_palindromo_debe_devolver_false_para_un_string_que_no_es_palindromo_con_varias_palabras
      palindromo = Palindromo.new
      assert !(palindromo.es_palindromo("habia una vez"))
   end

end
