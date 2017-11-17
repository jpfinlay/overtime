require 'rails_helper'

describe "top navbar navigation" do
  describe "when not logged in" do
    it "the navbar has the 'Home' and 'Sign In' links" do
      visit root_path
      expect(page).to have_link("Home", root_path)
      expect(page).to have_link("Sign In", new_user_session_path)
    end

    it "the navbar does not have the 'Entries' and 'Create New Entry' links" do
      visit root_path
      expect(page).to_not have_link("Time Entries", posts_path)
      expect(page).to_not have_link("New Time Entry", new_post_path)
    end
  end
end
