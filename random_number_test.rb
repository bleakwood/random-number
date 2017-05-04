require './random_number'

class RandomNumberTest

	def test_randomness
		random_nums = []
		1000.times do
			n = RandomNumber.generate(1,9)
			random_nums.push(n)
		end
		puts(get_frequency(random_nums).inspect)
		puts("Chi-square test " + (is_random(random_nums, 9) ? "has" : "has not") + " passed")
	end

	def is_random(random_nums, r)
		return false if(random_nums.length <= 10*r)
		
		ht = get_frequency(random_nums)
		n_r = random_nums.length / r
		chi_square = 0
		ht.each do |k,v|
			exp = RandomNumber.frequency(k) * random_nums.length
			f = (v - exp) ** 2
			chi_square += f / exp
		end

		return (chi_square - r).abs <= 2 * Math.sqrt(r)
	end

	def get_frequency(random_nums)
		freq = Hash.new
		random_nums.each do |num|
			if(freq.has_key?(num))
				freq[num] += 1
			else
				freq[num] = 1
			end
		end
		return freq
	end
end

rnt = RandomNumberTest.new
rnt.test_randomness