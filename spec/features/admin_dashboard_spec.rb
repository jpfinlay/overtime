require 'rails_helper'

describe "admin dashboard" do

  it "does not allow access to non-admin users" do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end

  it "it cannot be reached by non-admin users" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit admin_root_path
    expect(current_path).to eq(root_path)
    expect(page).to have_content("You are not authorized to access this page.")
  end

  it "it can be reached by an admin user" do
    admin_user = FactoryBot.create(:admin_user)
    login_as(admin_user, :scope => :user)
    visit admin_root_path
    expect(current_path).to eq(admin_root_path)
  end
end
