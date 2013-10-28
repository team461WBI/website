require 'spec_helper'

describe "Forums" do
	describe "NewThread" do
		it "makes a new thread (top-level comment)" do
			forum = FactoryGirl.create(:forum)
			user = FactoryGirl.create(:user)

			# log in
			visit log_in_path
			fill_in "Email", :with => user.email
			fill_in "Password", :with => user.password
			click_button "Log in"
			page.should have_content "Logged in!"
			page.should have_content user.name

			# create thread
			click_on "Forums"
			click_on forum.name
			click_on "New Thread"
			fill_in "Title", :with => "Thread for testing"
			fill_in "Content", :with => "The test made this thread to see if it worked"
			click_button "Create"

			# checks
			page.should have_content "Created"
			page.should have_content "successfully"
			page.should have_content user.name
			page.should have_content "Thread for testing"
			page.should have_content "The test made this thread to see if it worked"

			# make a comment
			fill_in "comment_content", :with => "A test comment"
			click_on "Comment"

			# checks
			page.should have_content "A test comment"
			page.should have_content "Created comment"
			page.should have_content "successfully"
		end
	end
end
