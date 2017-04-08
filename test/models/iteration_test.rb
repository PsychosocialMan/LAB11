require 'test_helper'

class IterationTest < ActiveSupport::TestCase
  test "should record unique data" do
    t = Iteration.new(:element => 121, :square => 14641)
	  t.save
	  n = Iteration.new(:element => 121, :square => 14641)
	  assert !n.save
  end
  
  test "should get different data" do
    t = Iteration.new(:element => 999999, :square => 6)
	  n = Iteration.new(:element => 888888, :square => 5)
	  t.save
	  n.save
	  a = Iteration.find_by(element: 999999)
	  b = Iteration.find_by(element: 888888)
	  assert_not_equal a.square, b.square
  end

  test 'should not save empty' do
    pal = Iteration.new
    assert !pal.save
  end
end
