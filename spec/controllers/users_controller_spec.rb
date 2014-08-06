require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:valid_attributes) do
    FactoryGirl.attributes_for(:user)
  end

  let(:invalid_attributes) do
    { :email => "abcdefg" }
    { :password => "11111" }
  end

  let(:logged_out_session) do
    {}
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}, {}
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creaes a new User" do
        expect {
          post :create, { user:valid_attributes }, logged_out_session
        }.to change(User, :count).by(1)
      end

      it "assigns a new user as @user" do
        post :create, { user: valid_attributes }, logged_out_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "logs the user in" do
        expect(controller).to receive(:login!).with(User)
        post :create, { user: valid_attributes }, logged_out_session
      end

      it "redirect to users_path" do
        post :create, { user: valid_attributes }, logged_out_session
        expect(response).to redirect_to(users_path)
      end
    end

    context "with invalid params" do
      it "assigns a new @user but does not save it" do
        post :create, { user: invalid_attributes }, logged_out_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "does not log the user in" do
        expect(controller).to_not receive(:login!)
        post :create, { user: invalid_attributes }, logged_out_session
      end

      it "returns a http request response with status 200" do
        post :create, { user: invalid_attributes }, logged_out_session
        expect(response.status).to eq(200)
      end
    end
  end
end
