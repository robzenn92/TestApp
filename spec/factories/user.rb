require 'faker'

FactoryGirl.define do

	factory :user do |user|
		user.name { Faker::Name.first_name }
		user.surname { Faker::Name.last_name }
		user.username { Faker::Internet.user_name }
		user.email { Faker::Internet.email(user.surname) }
		user.password_digest { Faker::Lorem.characters(6) }
	end

	factory :invalid_user, parent: :user do |user|
		user.name nil
		user.surname nil
		user.email nil
		user.password_digest nil
	end


	# factory :user_with_no_name, parent: :user do |f|
	# 	f.name nil
	# end

	# factory :user_with_no_name_and_surname, parent: :user_with_no_name do |f|
	# 	f.surname nil
	# end

end