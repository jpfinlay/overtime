require 'rails_helper'

describe "admin dashboard" do
  it "can be reached successfully" do
    visit admin_root_path
    expect(page.status_code).to eq(200)
  end

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
end
