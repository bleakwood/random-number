require './xorshift'

class RandomNumber
	def self.generate(low, high)
		distribution = []
		distribution[0] = self.frequency(0)
		for i in low..high
			distribution[i] = distribution[i-1] + self.frequency(i)
		end
		rand_num = Xorshift.new.rand(distribution[i] * 100)
		for i in low..high
			distribution[i] = distribution[i] * 100
			return i if(rand_num <= distribution[i])
		end
	end

	def self.frequency(d)
		return 0 if d < 1 or d > 9
		return Math.log10(1+1.0/d)
	end
end