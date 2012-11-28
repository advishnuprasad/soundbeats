require 'spec_helper'

describe AlbumsController do
  before :each do
    @album = FactoryGirl.create(:album)
  end

  describe "GET //index" do

    it "populates a list of albums" do
      get :index
      assigns(:albums).should eq([@album])
    end

    it "renders the index view" do
      get :index
      response.should render_template :index
    end

  end

  describe "GET //show" do

    it "renders the show view" do
      get :show, :id => @album.id
      response.should render_template :show
    end

  end

  describe "GET //new" do

    it "renders the new view" do
      get :new
      response.should render_template :new
    end

  end

  describe "GET //edit" do

    it "renders the edit view" do
      get :edit, :id => @album.id
      response.should render_template :edit
    end

  end

  describe "POST //create" do

    it "creates a new album" do
      expect{
        post :create, :album => FactoryGirl.attributes_for(:album)
      }.to change(Album, :count).by(1)
    end

  end

  describe "PUT //update" do

    it "updates an existing album" do
      put :update, :id => @album.id, :album => {:name => "newname", :genre => "newgenre"}
      @album.reload
      @album.name.should eq 'newname'
      @album.genre.should eq 'newgenre'
    end

  end

  describe "DELETE //destroy" do

    it "deletes an existing album" do
      expect{
        post :destroy, :id => @album.id
      }.to change(Album, :count).by(-1)
    end

  end

end
