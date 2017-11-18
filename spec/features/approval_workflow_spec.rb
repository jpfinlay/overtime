require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryBot.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'edit' do
    before do
      @post = FactoryBot.create(:post)
    end

    it 'has a status field that can be edited in the form' do
      visit edit_admin_post_path(@post)
      expect(@post.status).to eq('submitted')
      
      select('Approved', from: 'post_status')
      click_on('Update Post')
      expect(@post.reload.status).to eq('approved')
    end
  end

end
