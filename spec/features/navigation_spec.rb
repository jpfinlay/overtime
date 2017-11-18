require 'rails_helper'

describe "top navbar navigation" do
  describe "when not logged in" do
    it "has the 'Home' and 'Sign In' links" do
      visit root_path
      expect(page).to have_link("Home", root_path)
      expect(page).to have_link("Sign In", new_user_session_path)
    end

    it "does not have the 'Entries' and 'Create New Entry' links" do
      visit root_path
      expect(page).to_not have_link("My Entries", posts_path)
      expect(page).to_not have_link("New Time Entry", new_post_path)
    end
  end
  describe "as a logged in user" do
    before do
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
    end 
    it "has 'Home', 'Sign Out', 'My Entries' and 'Create New Entry' links" do
      visit root_path
      expect(page).to have_link("Home", root_path)
      expect(page).to have_link("Sign Out", destroy_user_session_path)
      expect(page).to have_link("My Entries", posts_path)
      expect(page).to have_link("New Entry", new_post_path)
    end
  end
  describe "as an admin user"
    xit "has a link to the Admin Dashboard" do
    end
end
