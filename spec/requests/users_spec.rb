require 'spec_helper'

describe "Visit root page" do

	it "should view the list of users" do
		visit root_url
		page.should have_content "Users"
		page.should have_link "New"
	end
end


describe "Starting on root path, filling user form" do

	before :each do
		visit users_url
	end

	context "with valid fields" do

		it "should create a new user and redirect to :show template" do

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
	     	page.should have_content "User was successfully created."
	     	page.should have_content "mariorossi"

    	end

    end

    context "without password confirmation" do

    	it "should not create a new user but render :new template" do
	     	expect {
				click_on "New"
				fill_in "user_name", with: "Mario"
				fill_in "user_surname", with: "Rossi"
				fill_in "user_username", with: "mariorossi"
				fill_in "user_email", with: "mariorossi@mario.com"
				fill_in "user_password", with: "mario92"
				click_on "Create User"
	     	}.to_not change(User, :count)
	     	page.should_not have_content "mariorossi"
	    end
    end

	# describe "populates an array of users" do

 # 		before :each do
	# 		@a = FactoryGirl.create(:user)
	# 		@b = FactoryGirl.create(:user)
	# 		@c = FactoryGirl.create(:user)
	#  	end

	#  	context "with 3 valid users" do

	# 		it "should get 3 valid users" do
	# 	   		visit users_url
	# 			page.should have_content "Users"

	# 	   		#Rails.logger.debug "ROOOOOOOOOOOOOOOOOOOOOOOOOOOOB".to_yaml

	# 	   		#Rails.logger.debug page.to_yaml

	# 	   		#page.find('.table').should have_content "Name"

	# 	   		#page.should have_content @b.name.to_s
	# 	   		#page.should have_content @c.name.to_s
	#    		end

	#    	end

 #   		context "with 4 valid users" do

	# 		it "should get 4 valid users" do
	# 	   		d = FactoryGirl.create(:user)

	# 	   		visit users_path
	# 	   		page.should have_content @a.name.to_s
	# 	   		page.should have_content @b.name.to_s
	# 	   		page.should have_content @c.name.to_s
	# 	   		page.should have_content d.name.to_s
	#    		end

	#    	end

	# end
end