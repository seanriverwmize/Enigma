require 'rails_helper'

describe Comment do
  context "when one of the required attributes of a comment is missing" do
    let(:user) {User.create!(email: "iamseanrivermize@gmail.com", password: "thepassword")}
    let(:product) {Product.create!(name: "new product", description: "description of product")}
    it "Should be invalid because there is no body" do
      expect(Comment.new(user: user, product: product, rating: 2)).to_not be_valid
    end
    it "Should be invalid because there is no rating" do
      expect(Comment.new(user: user, product: product, body: "this is a comment body")).to_not be_valid
    end
    it "Should be invalid because there is no product" do
      expect(Comment.new(user: user, body: "this is a comment body", rating: 2)).to_not be_valid
    end
    it "Should be invalid because there is no user" do
      expect(Comment.new(product: product, body: "this is a comment body", rating: 2)).to_not be_valid
    end
  end
end