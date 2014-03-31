class Filteranddiscount
	def self.runfilter(txt)
		blockedWords = ["fucking","shit","stupid","foolish"]
		blockedWords.each { |x|
			if txt.include? x
				txt.gsub!(x, "****")
			end
		}
		
		return txt
	end
	
	def self.rundiscount(discount,price)
			if discount=="10% off"
			   price=price/10*9
		    else if discount=="20% off"
			        price=price/10*8
				 else if discount=="30% off"
			          price=price/10*7
					  else if discount=="40% off"
			                  price=price/10*6
						   else if discount=="half price"
			                       price=price/2
				                end	
				           end	
				      end	
				 end
			end
		return price
	end
end	