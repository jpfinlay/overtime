require 'rails_helper'

RSpec.describe User, type: :model do
  describe do
    before do
      @user = User.create email: "test@example.com",
      password: "secret123",
      password_confirmation: "secret123",
      first_name: "John",
      last_name: "Doe"
    end

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name and last_name" do
      @user.email = "newtest@example.com"
      @user.first_name = nil
      @user.last_name = nil

      expect(@user).to_not be_valid
    end
  end
end
