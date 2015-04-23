require 'rails_helper'
require 'spec_helper'

describe "Users" do 
	before do 
  	@user = User.create(email: "mevanoff24@gmail.com", encrypted_password: "password")
	end
	describe "/GET User" do 
		it "can log in a user" do
			visit '/users/sign_in'
			fill_in "Email", with: "mevanoff24@gmail.com"
			fill_in "Password", with: "password"
			click_button "Log in"
			expect(page).to have_content "in"
		end
	end
end