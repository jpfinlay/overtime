require 'rails_helper'

describe "navigate" do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

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

    it "displays a table of posts" do
      post1 = FactoryBot.create :post
      post2 = FactoryBot.create :second_post
      visit posts_path
      expect(page).to have_content(/Some|More/)
    end
  end

  describe "create" do
    before do
      @user = FactoryBot.create :user
 
      login_as(@user, scope: :user)
      visit new_post_path
    end
 
    it "has a new form that can be reached" do
      expect(page.status_code).to eq(200)
    end
 
    it "accepts a date and rationale and submits the form" do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "A good rationale"
      click_on "Save"
      expect(page).to have_content("A good rationale")
    end
 
    it "belongs to a user" do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "Some rationale"
      click_on "Save"
      expect(@user.posts.last.rationale).to eq("Some rationale")
    end
  end
end
