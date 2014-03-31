require 'test/unit'
require 'x12117137'
class FilterTest < Test::Unit::TestCase
	# List of example bad words to test
	# Unit test to see if the code sees fucking is a bad word.
	def test_fucking
		assert_equal "You aaa bbb **** ccc",
		Filteranddiscount.runfilter("You aaa bbb fucking ccc")
	end

	# Test to see if the code sees shit is a bad word.
	def test_shit
		assert_equal "You hhh iii **** jjj",
		Filteranddiscount.runfilter("You hhh iii shit jjj")
	end
	
	# Test if stupid a bad word.
	def test_stupid
		assert_equal "You ooo ppp **** qqq",
		Filteranddiscount.runfilter("You ooo ppp stupid qqq")
	end
	
	# Test if foolish a bad word.
	def test_foolish
		assert_equal "You rrr sss **** ttt",
		Filteranddiscount.runfilter("You rrr sss foolish ttt")
	end
	
	#test if fucking and stupid a bad word
	def test_fucking_stupid
		assert_equal "You xxx **** yyy **** zzz",
		Filteranddiscount.runfilter("You xxx fucking yyy stupid zzz")
	end
	
	#test fucking twice
	def test_fucking_again
		assert_equal "You xxx **** yyy **** zzz",
		Filteranddiscount.runfilter("You xxx fucking yyy fucking zzz")
	end
	
end # End of Class

class DiscountTest < Test::Unit::TestCase
	
	def test_10percentoff
			assert_equal 90,
			Filteranddiscount.rundiscount("10% off",100)
	end
	
	def test_20percentoff
			assert_equal 80,
			Filteranddiscount.rundiscount("20% off",100)
	end
	
	def test_30percentoff
			assert_equal 70,
			Filteranddiscount.rundiscount("30% off",100)
	end
	
	def test_40percentoff
			assert_equal 60,
			Filteranddiscount.rundiscount("40% off",100)
	end
	
	def test_halfprice
			assert_equal 50,
			Filteranddiscount.rundiscount("half price",100)
	end
	
	def test_fullprice
			assert_equal 100,
			Filteranddiscount.rundiscount("full price",100)
	end

end