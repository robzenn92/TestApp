require 'spec_helper'

describe "Create a new user from index view" do

	it "should create a new user" do

		visit users_url
     	expect {

			click_link "New"
			fill_in "user_name", with: "Mario"
			fill_in "user_surname", with: "Rossi"
			fill_in "user_username", with: "mariorossi"
			fill_in "user_email", with: "mariorossi@mario.com"
			fill_in "user_password", with: "mario92"
			fill_in "user_password_confirmation", with: "mario92"
			click_button "Create User"
     	}.to change(User, :count).by(1)
     	#page.should have_content "User was successfully created."
     	page.should have_content "mariorossi"
    end
end