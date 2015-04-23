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

		before do 
			User.delete_all
		end
		it "signs up new user" do
			visit '/users/sign_in'
			click_link "Sign up"
			fill_in "Name", with: "bobby"
			fill_in "Email", with: "bob@bobby.com"
			find('input#user_password').set('password')
			fill_in "Password confirmation", with: "password"
			click_button "Sign up"
			expect(page).to have_content "Welcome"
		end
	end
end