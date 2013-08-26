require 'faker'

module FactoryHelper

	def long
		Faker::Lorem.characters(41)
	end

	def short
		Faker::Lorem.characters(1)
	end

	def valid_password
		Faker::Lorem.characters(6)
	end

	def invalid_password
		Faker::Lorem.characters(5)
	end

end