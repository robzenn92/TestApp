require 'spec_helper'
require 'factories/factory_helper'

describe User do

	describe "Creating a new user" do

		# VALID USER
		# -------------------------------------------------------------------

		it "Should create a user with name, surname, email and password" do
			u = FactoryGirl.create(:user)
			u.should be_valid
		end

		# EMPTY USER
		# -------------------------------------------------------------------

		it "Should not create an empty user" do
			u = FactoryGirl.build(:user)
			u.name = nil
			u.surname = nil
			u.username = nil
			u.email = nil
			u.password_digest = nil
			u.should_not be_valid
		end

		# SHORT ATTRIBUTES
		# -------------------------------------------------------------------

		it "Should not create a user with short NAME" do
			u = FactoryGirl.build(:user, name: FactoryHelper::short)
			u.should_not be_valid
		end

		it "Should not create a user with short SURNAME" do
			u = FactoryGirl.build(:user, surname: FactoryHelper::short)
			u.should_not be_valid
		end

		it "Should not create a user with short USERNAME" do
			u = FactoryGirl.build(:user, username: FactoryHelper::short)
			u.should_not be_valid
		end

		it "Should not create a user with short PASSWORD" do
			u = FactoryGirl.build(:user, password_digest: FactoryHelper::invalid_password)
			u.should_not be_valid
		end

		# LONG ATTRIBUTES
		# -------------------------------------------------------------------

		it "Should not create a user with long NAME" do
			u = FactoryGirl.build(:user, name: FactoryHelper::long)
			u.should_not be_valid
		end

		it "Should not create a user with long SURNAME" do
			u = FactoryGirl.build(:user, surname: FactoryHelper::long)
			u.should_not be_valid
		end

		it "Should not create a user with long USERNAME" do
			u = FactoryGirl.build(:user, username: FactoryHelper::long)
			u.should_not be_valid
		end

		it "Should not create a user with long PASSWORD" do
			u = FactoryGirl.build(:user, username: FactoryHelper::invalid_password)
			u.should_not be_valid
		end

		# WITHOUT SOME ATTRIBUTES
		# -------------------------------------------------------------------

		it "Should not create a user without name" do
			u = FactoryGirl.build(:user, name: nil)
			u.should_not be_valid
		end

		it "Should not create a user without surname" do
			u = FactoryGirl.build(:user, surname: nil)
			u.should_not be_valid
		end

		it "Should not create a user without username" do
			u = FactoryGirl.build(:user, username: nil)
			u.should_not be_valid
		end

		it "Should not create a user without email" do 
			u = FactoryGirl.build(:user, email: nil)
			u.should_not be_valid
		end

		it "Should not create a user without password" do
			u = FactoryGirl.build(:user, password_digest: nil)
			u.should_not be_valid
		end
	end

	describe "Testing instance methods" do

		it "full_name method should returns full name" do
			user = FactoryGirl.build(:user)
			user.full_name == [user.name, user.surname].join(" ")
		end
		
	end
	
	describe "Searching for a user" do

	 	before :each do
			@smith = FactoryGirl.create(:user, username: "marietto")
			@jones = FactoryGirl.create(:user, name: "jonetta") 
			@johnson = FactoryGirl.create(:user, name: "google")
	 	end

	 	context "Find a user" do
	 		it "Returns the user searched" do
	 			User.search("marietto").should == @jones
	 		end
	 	end

	 	context "No user found" do
	 		it "Does not returns the user searched" do
	 			User.search("yahoo").should == nil
	 		end
	 	end
 	end
end