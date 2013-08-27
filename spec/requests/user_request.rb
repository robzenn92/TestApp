require 'spec_helper'

describe "Visit root page" do

	it "should view the list of users" do
		visit root_url
		page.should have_content "Users"
		page.should have_link "New"
	end
end


describe "Starting on root path" do

	before :each do
		visit users_url
	end

	context "should create a new user with valid fields" do

		it "" do

	     	expect {
				click_on "New"
				fill_in "user_name", with: "Mario"
				fill_in "user_surname", with: "Rossi"
				fill_in "user_username", with: "mariorossi"
				fill_in "user_email", with: "mariorossi@mario.com"
				fill_in "user_password", with: "mario92"
				fill_in "user_password_confirmation", with: "mario92"
				click_on "Create User"
	     	}.to change(User, :count).by(1)
	     	page.should have_content "User was successfully created."
	     	page.should have_content "mariorossi"

    	end

    end

    context "should not create a new user without password confirmation" do

    	it "" do
	     	expect {
				click_on "New"
				fill_in "user_name", with: "Mario"
				fill_in "user_surname", with: "Rossi"
				fill_in "user_username", with: "mariorossi"
				fill_in "user_email", with: "mariorossi@mario.com"
				fill_in "user_password", with: "mario92"
				click_on "Create User"
	     	}.to change(User, :count).by(0)
	     	page.should have_content "Some errors occurred."
	     	page.should_not have_content "mariorossi"
	    end
    end
end