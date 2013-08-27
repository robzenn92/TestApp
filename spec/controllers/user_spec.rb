require 'spec_helper'

describe UsersController do

 describe "GET #index" do

	it "has a 200 status code" do
     	get :index
     	expect(response.status).to eq(200)
    end

 	it "renders the :index view" do
    	get :index
    	response.should render_template :index
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
 end
 
 describe "GET #show" do

 	it "assigns the requested user to @user" do
 		u = FactoryGirl.create(:user)
 		get :show, id: u
 		assigns(:user).should eq(u)
 	end

 	it "renders the :show template" do
 		u = FactoryGirl.create(:user)
 		get :show, id: u
 		response.should render_template :show
 	end
 end
 
 describe "GET #new" do
 	it "assigns a new user to @user"
 	it "renders the :new template"
 end
 
 describe "POST #create" do

 	context "with valid attributes" do

 		it "saves the new user in the database" do
 			expect{
        		post :create, user: FactoryGirl.attributes_for(:user)
      		}.to change(User,:count).by(1)
 		end
 		
 		it "redirects to the home page" do
 			u =  FactoryGirl.attributes_for(:user)
  			post :create, user: u
  			response.should redirect_to user: u
		end
 	end

 	context "with invalid attributes" do

 		it "does not save the new user in the database" do
 			expect{
        		post :create, user: FactoryGirl.attributes_for(:invalid_user)
      		}.to_not change(User,:count)
 		end

 		it "re-renders the :new template" do
			post :create, user: FactoryGirl.attributes_for(:invalid_user)
  			response.should redirect_to new_user_path
 		end
 	end
 end

end