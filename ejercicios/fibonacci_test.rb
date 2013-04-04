require './fibonacci'
require 'test/unit'

class FibonacciTest < Test::Unit::TestCase

   def test_tiene_raiz_cuadrada_perfecta_debe_devolver_true_para_veinticinco
      fibonacci = Fibonacci.new
      assert fibonacci.tiene_raiz_cuadrada_perfecta(25)
   end

   def test_tiene_raiz_cuadrada_perfecta_debe_devolver_false_para_treinta_y_dos
      fibonacci = Fibonacci.new
      assert !(fibonacci.tiene_raiz_cuadrada_perfecta(32))
   end

   def test_es_de_fibonacci_debe_devolver_true_para_ciento_cuarenta_y_cuatro
      fibonacci = Fibonacci.new
      assert fibonacci.es_de_fibonacci(144)
   end

   def test_es_de_fibonacci_debe_devolver_false_para_cuatrocientos_cincuenta_y_cinco
      fibonacci = Fibonacci.new
      assert !(fibonacci.es_de_fibonacci(455))
   end
end
