require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe LinksController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Link. As you add validations to Link, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {:url => 'http://example.com/widgets'}
  end

  let(:invalid_attributes) do
    # We shouldn't be able to submit a short_name ourselves
    {:short_name => 'waffles'}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LinksController. Be sure to keep this updated too.
  let(:valid_session) do
    {}
  end

  describe "GET index" do
    it "assigns all links as @links" do
      link = Link.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:links)).to eq([link])
    end
  end

  describe "GET show" do
    it "redirects to the link's URL" do
      link = Link.create! valid_attributes
      get :show, {:short_name => link.to_param}, valid_session
      expect(response).to redirect_to(link.url)
    end

    it "increments the value of clicks_count" do
      link = Link.create! valid_attributes
      expect {
        get :show, {:short_name => link.to_param}, valid_session
      }.to change{ link.reload.clicks_count }.by(1)
    end
  end

  describe "GET new" do
    it "assigns a new link as @link" do
      get :new, {}, valid_session
      expect(assigns(:link)).to be_a_new(Link)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Link" do
        expect {
          post :create, {:link => valid_attributes}, valid_session
        }.to change(Link, :count).by(1)
      end

      it "assigns a newly created link as @link" do
        post :create, {:link => valid_attributes}, valid_session
        expect(assigns(:link)).to be_a(Link)
        expect(assigns(:link)).to be_persisted
      end

      it "redirects to the root URL" do
        post :create, {:link => valid_attributes}, valid_session
        expect(response).to redirect_to(root_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved link as @link" do
        post :create, {:link => invalid_attributes}, valid_session
        expect(assigns(:link)).to be_a_new(Link)
      end

      it "re-renders the 'new' template" do
        post :create, {:link => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
