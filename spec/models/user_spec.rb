require 'spec_helper'

describe User do

	describe "Creating a new user" do

		before :all do

			@long = Faker::Lorem.characters(21)
			@short = Faker::Lorem.characters(1)
			@valid_password = Faker::Lorem.characters(6)
			@invalid_password = Faker::Lorem.characters(5)

		end

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

		it "Should not create a user with no password and password_confirmation" do
			u = FactoryGirl.build(:user)
			u.password = nil
			u.password_confirmation = nil
			u.should_not be_valid
		end

		it "Should not create a user with no password_digest" do
			u = FactoryGirl.build(:user)
			u.password_digest = nil
			u.should_not be_valid
		end

		# SHORT ATTRIBUTES
		# -------------------------------------------------------------------

		it "Should not create a user with short NAME" do
			include 'FactoryHelper'
			u = FactoryGirl.build(:user, name: @short )
			u.should_not be_valid
		end

		it "Should not create a user with short SURNAME" do
			u = FactoryGirl.build(:user, surname: @short )
			u.should_not be_valid
		end

		it "Should not create a user with short USERNAME" do
			u = FactoryGirl.build(:user, username: @short)
			u.should_not be_valid
		end

		it "Should not create a user with short PASSWORD" do
			u = FactoryGirl.build(:user, password: @invalid_password,  password_confirmation: @invalid_password)
			u.should_not be_valid
		end

		# LONG ATTRIBUTES
		# -------------------------------------------------------------------

		it "Should not create a user with long NAME" do
			u = FactoryGirl.build(:user, name: @long )
			u.should_not be_valid
		end

		it "Should not create a user with long SURNAME" do
			u = FactoryGirl.build(:user, surname: @long )
			u.should_not be_valid
		end

		it "Should not create a user with long USERNAME" do
			u = FactoryGirl.build(:user, username: @long)
			u.should_not be_valid
		end

		it "Should not create a user with long PASSWORD" do
			u = FactoryGirl.build(:user, password: @long, password_confirmation: @long)
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
			u = FactoryGirl.build(:user, password: nil,  password_confirmation: nil)
			u.should_not be_valid
		end
	end

	describe "Testing instance methods" do

		it "should downcase and capitalize name" do
			user = FactoryGirl.create(:user, name: "marIo")
			user.name.should eq "Mario"
		end

		it "should downcase and capitalize surname" do
			user = FactoryGirl.create(:user, surname: "ROssI")
			user.surname.should eq "Rossi"
		end

		it "full_name method should returns full name" do
			user = FactoryGirl.build(:user)
			user.name.upcase
			user.surname.upcase
			user.full_name.should eq [user.name, user.surname].join(" ")
		end

	end
	
	describe "Searching for a user" do

	 	before :each do
			@marietto = FactoryGirl.create(:user, username: "Marietto")
			@jonetta = FactoryGirl.create(:user, username: "Jonetta") 
			@google = FactoryGirl.create(:user, username: "Google")
	 	end

	 	context "Found a user" do
	 		it "Returns the user searched" do
	 			User.search("Marietto").should == @marietto
	 		end
	 	end

	 	context "No user found" do
	 		it "Does not returns the user searched" do
	 			User.search("Yahoo").should == nil
	 		end
	 	end
 	end
end