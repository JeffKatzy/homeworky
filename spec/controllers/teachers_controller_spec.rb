require 'spec_helper'

describe TeachersController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "assigns a new Teacher to @teacher" do
      get :new
      expect(assigns(:teacher)).to be_a_new(Teacher)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new teacher in the database" do
          expect{
          post :create, teacher: attributes_for(:teacher)
          }.to change(Teacher, :count).by(1)
      end


      it "redirects to the home page" do
        post :create, teacher: attributes_for(:teacher)
        expect(response).to redirect_to :teacher
      end
    end

    context "with invalid attributes" do
      it "does not save a new teacher in the database" do
        expect{
          post :create, teacher: attributes_for(:invalid_teacher)
        }.to_not change(Teacher, :count)
      end

      it "re-renders the :new template" do
        post :create, teacher: attributes_for(:invalid_teacher)
        expect(response).to render_template 'new'
      end
    end
  end
end
