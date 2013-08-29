require 'spec_helper'

FactoryGirl.define do
	factory :message do |message|
		message.title "Titolo"
		message.content Faker::Lorem.words(50)
		message.read_at "2013-08-29 19:11:05"
	end

	factory :unread_message, parent: :message |message| do
	    message.read_at nil
	end
end