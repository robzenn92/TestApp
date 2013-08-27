require 'faker'

FactoryGirl.define do

	factory :user do |user|
		user.name { Faker::Name.first_name }
		user.surname { Faker::Name.last_name }
		user.username { Faker::Lorem.characters(10) }
		user.email { Faker::Internet.email(user.surname) }
		user.password { "password" }
		user.password_confirmation { "password" }
	end

	factory :invalid_user, parent: :user do |user|
		user.name nil
		user.surname nil
		user.email nil
		user.password nil
		user.password_confirmation nil
	end


	# factory :user_with_no_name, parent: :user do |f|
	# 	f.name nil
	# end

	# factory :user_with_no_name_and_surname, parent: :user_with_no_name do |f|
	# 	f.surname nil
	# end

end