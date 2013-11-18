require 'spec_helper'


describe SessionsController do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # update the return value of this method accordingly.
  

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new
      response.should be_success
    end  
  end

  describe "POST create" do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    describe "with valid params" do
      it "finds an existing User" do 
        post :create, email: @user.email, password: "password"
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "redirects the user to the root" do 
        post :create, email: @user.email, password: "password"
        expect(response).to redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do 
        post :create, email: "", password: ""
        expect(response).to render_template('new')
      end
    end
  end
end


