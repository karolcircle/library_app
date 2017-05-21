require 'rails_helper'

describe User do
  it "is valid with an email and password" do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end

  it "is invalid without a email" do
    user = User.new(email: nil, password: "testtest")
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end 

  it "is invalid without an author" do
    user = User.new(email: "test@example.com", password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
end   
