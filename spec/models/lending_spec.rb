require 'rails_helper'

describe Lending do
  it "is valid with book and user ids" do
    lending = FactoryGirl.create(:lending)
    expect(lending).to be_valid
  end

  it "is invalid without a book id" do
    user = FactoryGirl.create(:user)
    lending = Lending.new(book_id: nil, user_id: user.id )
    lending.valid?
    expect(lending.errors[:book_id]).to include("can't be blank")
  end 

  it "is invalid without an user id" do
    book = FactoryGirl.create(:book)
    lending = Lending.new(book_id: book.id, user_id: nil )
    lending.valid?
    expect(lending.errors[:user_id]).to include("can't be blank")
  end   
end
