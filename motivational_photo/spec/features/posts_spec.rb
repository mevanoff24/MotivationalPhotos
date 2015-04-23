require 'rails_helper'
require 'spec_helper'

describe "Posts" do
    before do 
    	@user = User.create(email: "mevanoff24@gmail.com", encrypted_password: "password")
    	@post = Post.create(title: "poster", link: "google.com", description: "motivational quote", user_id: @user.id)
    end
  describe "GET /posts" do
    it "displays some posts" do
    	visit posts_path
    	expect(page).to have_content("poster")
    end

    it "can create a new post" do
    	visit '/posts/new'
    	fill_in "Title", with: "new post"
    	fill_in "Image", with: "example.png"
    	fill_in "Description", with: "new description"
    	click_button "Create Post"
    	expect(page).to have_content("new post")
    	expect(page).to have_content("Successfully Added Post")
    end

    it "can edit a post" do 
    	visit posts_path
    	click_link "Edit"
    	expect(page).to have_selector("input[value='poster']")
    	fill_in "Title", with: "updated title"
    	click_button "Update Post"
    	expect(page).to have_content("updated title")
    	expect(page).to have_content("Successfully Updated Post")
    end

    it "should not update a blank post" do 
    	visit posts_path
    	click_link "Edit"
    	fill_in "Title", with: ""
    	click_button "Update Post"
    	expect(page).to have_content("Failed to Update Post")
    end
  end

  describe "GET /post" do 
  	it "can view a single post" do 
  		visit posts_path 
  		click_link "View"
  		expect(page).to have_content("poster")
  	end

  	it "can delete a post" do 
  		visit post_path(@post)
  		click_link "Delete"
  		expect(page).to have_content("Successfully Deleted Post")
  	end
  end
end
