require "rails_helper"

RSpec.describe "Category", type: :request do
  it "allows any guest to view the categories, but not create or edit" do
    get categories_path
    expect(response).to be_successful
    expect(response.body).to include("Food")
    expect(response.body).to include("Commodity")
    expect(response.body).to include("Luxury")
    expect(response.body).not_to include("Edit")
    expect(response.body).not_to include("New Category")
  end

  it "allows any user to view the categories as well" do
    #get the login page
    get "/sessions/new"
    expect(response).to render_template(:new)

    #log in as an admin
    post "/sessions", params: {:email => "cmfoley2@ncsu.edu", :password => "colin"}

    get categories_path
    expect(response).to be_successful
    expect(response.body).to include("Food")
    expect(response.body).to include("Commodity")
    expect(response.body).to include("Luxury")
    expect(response.body).not_to include("Edit")
    expect(response.body).not_to include("New Category")
  end

  it "allows an admin to create a category" do
    #get the login page
    get "/sessions/new"
    expect(response).to render_template(:new)

    #log in as an admin
    post "/sessions", params: {:email => "csc517store@gmail.com", :password => "admin"}

    #Get the new template
    get "/categories/new"
    expect(response).to render_template(:new)

    #Create the category
    post "/categories", params: {:category => {:name => "Test Category", :tax_slab => 0.5}}

    expect(response).to redirect_to(assigns(:category))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("Category was successfully created.")
    expect(response.body).to include("Test Category")
    expect(response.body).to include(".5")
  end

  it "allows an admin to edit a category by id" do
    #get the login page
    get "/sessions/new"
    expect(response).to render_template(:new)

    #log in as an admin
    post "/sessions", params: {:email => "csc517store@gmail.com", :password => "admin"}

    #Get the edit template
    get "/categories/4/edit"
    expect(response).to render_template(:edit)

    #Create the category
    put "/categories/3", params: {:category => {:name => "Good Food", :tax_slab => 0.05}}

    expect(response).to redirect_to(assigns(:category))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("Category was successfully updated.")
    expect(response.body).to include("Good Food")
    expect(response.body).to include(".05")
  end

end