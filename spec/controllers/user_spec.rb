require 'spec_helper'

describe UsersController do

	# METHOD GET
	# -------------------------------------------------------------------

	describe "GET #index" do

	   	it "has a 200 status code" do
		  	get :index
		  	expect(response.status).to eq(200)
		  	response.status.should eq 200
	  	end

	  	it "renders the :index view" do
	   		get :index
	   		response.should render_template :index
   		end
   		
	end

	describe "GET #show" do

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


	# METHOD POST
	# -------------------------------------------------------------------

	describe "POST #create" do

  		context "with valid attributes" do

			it "saves the new user in the database" do
				expect{
					post :create, user: FactoryGirl.attributes_for(:user)
				}.to change(User,:count).by(1)
			end
		
			it "redirects to the new user page" do
				post :create, user: FactoryGirl.attributes_for(:user)
				response.should redirect_to User.last
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
				response.should render_template :new
			end
		end
	end


	# METHOD DELETE
	# -------------------------------------------------------------------

	describe 'DELETE #destroy' do

		before :each do
			@user = FactoryGirl.create(:user)
		end

		it "deletes the user" do
			expect{
				delete :destroy, id: @user
			}.to change(User,:count).by(-1)
		end

		it "redirects to users#index" do
			delete :destroy, id: @user
			response.should redirect_to users_path
		end
	end
end