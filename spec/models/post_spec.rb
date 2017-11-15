require 'rails_helper'

RSpec.describe Post, type: :model do
  describe do
    before do
      @post = FactoryBot.create :post
    end

    it "can be created" do
      #expect(@post).to be_valid
    end

    it "cannot be created without date and rationale" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end

    it "has a default status of 'Submitted'" do
      expect(@post.submitted?).to be true
    end
  end
end
