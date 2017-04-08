class String
  def numeric?
    Float(self) != nil rescue false
  end
end

class PalindromeController < ApplicationController
  def input
  end

  def output
    n = (buf = params[:n]).numeric? ? buf.to_f : -1

    if Iteration.last == nil || Iteration.last.element < n 
      @result_array = find_them_all(n)
      @square_array = @result_array.map{ |x| x**2 }
      Iteration.destroy_all
      @result_array.each_with_index{ |x, i| Iteration.create(element: x, square: @square_array[i]) }
    else
      @result_array = (buf = Iteration.where("element <= ?", n)).map{ |x| x.element.to_i }
      @square_array = buf.map{ |x| x.square.to_i }
    end
    @num = @result_array.length
  end 

  private def find_them_all(n)
    0.upto(n).select do |x|
			(flag = is_palindrome?(x)) && flag == is_palindrome?(x**2)
    end
  end

  private def is_palindrome?(num)
    num.to_s.eql?(num.to_s.reverse)
  end

  def last
    @flag_empty = false
    if Iteration.last == nil
      @flag_empty = true
    else
      @result_array = (buf = Iteration.all).map{ |x| x.element.to_i }
      @square_array = buf.map{ |x| x.square.to_i }
      @num = @result_array.length
      @id = Iteration.all.map{ |x| x.id }
    end
  end
end

