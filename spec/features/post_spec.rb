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
      visit root_path
    end
 
    it "has a new form that can be reached from the root url" do
      click_link("Create New Entry")
      expect(page.status_code).to eq(200)
    end
 
    it "accepts a date and rationale and submits the form with the default status 'Submitted'" do
      visit new_post_path
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "A good rationale"
      click_on "Save"
      expect(page).to have_content("A good rationale")
      expect(page).to have_content("submitted")
    end
 
    it "belongs to a user" do
      visit new_post_path
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "Some rationale"
      click_on "Save"
      expect(@user.posts.last.rationale).to eq("Some rationale")
    end
  end

  describe "delete" do
    before do
      Post.delete_all
      @user = FactoryBot.create :user
      login_as(@user, scope: :user)
      @post = FactoryBot.create :post
    end
 
    it "can be deleted when clicking 'Delete' on the index page" do
      visit posts_path
      click_link("delete_post_#{@post.id}")
      expect(page.status_code).to eq(200)
    end
  end

  describe "edit" do
    before do
      Post.delete_all
      @post = FactoryBot.create(:post)
    end

    it "can be reached by clicking 'Edit' on the index page" do
      visit posts_path
      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

    it "can be edited" do
      visit edit_post_path(@post)
      fill_in "post[date]", with: Date.yesterday
      fill_in "post[rationale]", with: "Edited rationale"
      click_on "Save"
      expect(page).to have_content("Edited rationale")
    end
  end
end
