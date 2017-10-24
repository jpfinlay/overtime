require 'rails_helper'

describe "navigate" do
  describe "index" do
    it "can be reached successfully" do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it "has the title 'Overtime'" do
      visit posts_path
      expect(page.title).to eq("Overtime")
    end

    it "has the heading 'Posts'" do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  # describe "create" do
  #   before do
  #     @user = User.first
  #
  #     login_as(@user, scope: :user)
  #     visit new_post_path
  #   end
  #
  #   it "has a new form that can be reached" do
  #     expect(page.status_code).to eq(200)
  #   end
  #
  #   it "accepts a date and rationale and submits the form" do
  #     fill_in "post[date]", with: Date.today
  #     fill_in "post[rationale]", with: "A good rationale"
  #     click_on "Save"
  #     expect(page).to have_content("A good rationale")
  #   end
  #
  #   it "belongs to a user" do
  #     fill_in "post[date]", with: Date.today
  #     fill_in "post[rationale]", with: "Some rationale"
  #     click_on "Save"
  #     expect(@user.posts.last.rationale).to eq("Some rationale")
  #   end
  # end
end
