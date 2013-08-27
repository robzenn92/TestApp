require 'spec_helper'

describe UsersController do

	describe "GET #index" do

	   it "has a 200 status code" do
		  visit users_path
		  expect(response.status).to eq(200)
	  end

	  it "renders the :index view" do
	   visit users_path
	   response.should render_template users_path
   end

   it "renders the RSpec generated template" do
	   visit users_url
	   page.should have_content "Users"
   end

   describe "populates an array of users" do

	 before :each do
		 @a = FactoryGirl.create(:user)
		 @b = FactoryGirl.create(:user)
		 @c = FactoryGirl.create(:user)
	 end

	 context "with 3 valid users" do

		it "populates an array of 3 valid users" do
		   visit users_path
		   page.should have_content @a.name
		   page.should have_content @b.name
		   page.should have_content @c.name
	   end

   end

   context "with 4 valid users" do

	it "should get 4 users" do
	   @d = FactoryGirl.create(:user)

	   visit users_path
	   page.should have_content @a.name
	   page.should have_content @b.name
	   page.should have_content @c.name
	   page.should have_content @d.name
   end
end
end
end

describe "GET #show" do

  it "assigns the requested user to @user" do
	 u = FactoryGirl.create(:user)
	 visit user_path, id: u
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
			page.should have_content "User was successfully created."
		end
		
		it "redirects to the home page" do
			u =  FactoryGirl.attributes_for(:user)
			post :create, user: u
			response.should redirect_to user_path assigns(:user)
		end
	end

	context "with invalid attributes" do

	 it "does not save the new user in the database" do
		expect{
		  post :create, user: FactoryGirl.attributes_for(:invalid_user)
		  }.to_not change(User, :count)
	  end

	  it "re-renders the :new template" do

		visit new_user_path
		post :create, user: FactoryGirl.attributes_for(:invalid_user)
		response.should redirect_to users_path
		page.should have_content "Some errors occurred."
	end
end
end