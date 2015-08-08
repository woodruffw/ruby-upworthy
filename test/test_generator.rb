require 'minitest/autorun'
require 'upworthy'

class UpworthyGeneratorTest < Minitest::Test
	def test_generator
		# not much else we can do
		assert Upworthy.headline.is_a? String
	end
end
