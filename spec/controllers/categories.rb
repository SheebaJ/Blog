require 'rails_helper'

describe CategoriesController do

  describe "GET category#index" do
  context "when the user is an admin" do
    it "should list all categories" do
      
    end
  end

  context "when the user is not an admin" do
    it "should only be able to read " 
  end

  context "when the user is logged in" do
    it "should render catgeory#index"
    end
    context "when the user is logged out" do
      it "should redirect to the login page"
    end
  end
  
  describe "GET #show" do
    it "assigns the requested category to @category"
    it "renders the :show template"
  end
  
  describe "GET #new" do
    it "assigns a new Category to @category"
    it "renders the :new template"
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new category in the database"
      it "redirects to the home page"
    end
    
    context "with invalid attributes" do
      it "does not save the new contact in the database"
      it "re-renders the :new template"
    end
end
end