require 'spec_helper'

describe UsersController do

 describe "GET #index" do

	it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the RSpec generated template" do
    	get :index
    	expect(response.body).to eq("")
    end

    describe "populates an array of users" do

	 	before :all do
			@a = FactoryGirl.create(:user)
			@b = FactoryGirl.create(:user)
			@c = FactoryGirl.create(:user)
	 	end

    	context "with 3 valid users" do

		 	it "populates an array of 3 valid users" do
		 		get :index
		 		assigns(:users).should == [@a, @b, @c]
		 	end

		end

    	context "with 4 valid users" do

		 	it "should get 4 users" do

		 		d = FactoryGirl.create(:user)

		 		get :index
		 		assigns(:users).should == [@a,@b,@c,d]
		 	end
		end
    end

 	it "renders the :index view"
 end
 
 describe "GET #show" do
 	it "assigns the requested user to @user"
 	it "renders the :show template"
 end
 
 describe "GET #new" do
 	it "assigns a new user to @user"
 	it "renders the :new template"
 end
 
 describe "POST #create" do

 	context "with valid attributes" do
 		it "saves the new user in the database"
 		it "redirects to the home page"
 	end

 	context "with invalid attributes" do
 		it "does not save the new user in the database"
 		it "re-renders the :new template"
 	end
 end

end