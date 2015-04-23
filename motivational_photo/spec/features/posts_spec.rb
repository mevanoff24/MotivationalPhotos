require 'rails_helper'
require 'spec_helper'

describe "Posts" do
    before do 
    	@post = Post.create(title: "poster", image: "example.png", description: "motivational quote")
    end
  describe "GET /posts" do
    it "displays some posts" do
    	visit posts_path
    	expect(page).to have_content("poster")
    end

    it "can create a new task" do
    	visit posts_path
    	click_link "Create New Post"
    	fill_in "Title", with: "new post"
    	fill_in "Description", with: "new description"
    	click_button "Create Post"
    	expect(page).to have_content("new post")
    	expect(page).to have_content("Successfully added post")
    end
  end
end
