require 'spec_helper'

describe User do

	describe "Creating a new user:" do

		before :all do

			@long = Faker::Lorem.characters(21)
			@short = Faker::Lorem.characters(1)
			@valid_password = Faker::Lorem.characters(6)
			@invalid_password = Faker::Lorem.characters(5)

		end

		# VALID USER
		# -------------------------------------------------------------------

		context "with valid name, surname, email and password" do

			it "should create a valid user" do
				u = FactoryGirl.create(:user)
				u.should be_valid
			end

		end

		# EMPTY USER
		# -------------------------------------------------------------------

		context "with all nil attributes" do

			it "should not create an empty user" do
				u = FactoryGirl.build(:invalid_user)
				u.should_not be_valid
			end

		end

		# DIFFERENT PASSWORD AND PASSWORD CONFIRMATION
		# -------------------------------------------------------------------

		context "with different password and password_confirmation" do

			it "should not create a user" do
				u = FactoryGirl.build(:user)
				u.password = nil
				u.password_confirmation = nil
				u.should_not be_valid
			end

		end

		# SHORT ATTRIBUTES
		# -------------------------------------------------------------------

		context "with SHORT and invalid attributes" do

			%w(name surname username password password_confirmation).each do |attr|

				it "should not create a user with short #{attr.upcase}" do
					u = FactoryGirl.build(:user, attr => @short )
					u.should_not be_valid
				end

			end

			it "Should not create a user with short PASSWORD AND PASSWORD_CONFIRMATION" do
				u = FactoryGirl.build(:user, password: @invalid_password,  password_confirmation: @invalid_password)
				u.should_not be_valid
			end

		end


		# LONG ATTRIBUTES
		# -------------------------------------------------------------------

		context "with LONG and invalid attributes" do

			%w(name surname username password password_confirmation).each do |attr|

				it "should not create a user with long #{attr.upcase}" do
					u = FactoryGirl.build(:user, attr => @LONG )
					u.should_not be_valid
				end

			end

			it "Should not create a user with long PASSWORD AND PASSWORD_CONFIRMATION" do
				u = FactoryGirl.build(:user, password: @long, password_confirmation: @long)
				u.should_not be_valid
			end

		end

		# WITHOUT SOME ATTRIBUTES
		# -------------------------------------------------------------------


		context "without some attributes" do

			%w(name surname username password password_confirmation).each do |attr|

				it "Should not create a user with no #{attr.upcase}" do
					u = FactoryGirl.build(:user, attr => nil)
					u.should_not be_valid
				end

			end

			it "should not create a user with no password and password_confirmation" do
				u = FactoryGirl.build(:user)
				u.password = nil
				u.password_confirmation = nil
				u.should_not be_valid
			end

			it "should not create a user with no password_digest" do
				u = FactoryGirl.build(:user)
				u.password_digest = nil
				u.should_not be_valid
			end

		end

	end

	describe "Testing instance methods" do

		it "should downcase and capitalize the name" do
			user = FactoryGirl.create(:user, name: "marIo")
			user.name.should eq "Mario"
		end

		it "should downcase and capitalize the surname" do
			user = FactoryGirl.create(:user, surname: "ROssI")
			user.surname.should eq "Rossi"
		end

		it "full_name method should return full name" do
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

	 	context "User found" do
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