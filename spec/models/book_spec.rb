require 'rails_helper'

describe Book do
  it "is valid with a title and author" do
    book = FactoryGirl.create(:book)
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(title: nil, author: "Test")
    book.valid?
    expect(book.errors[:title]).to include("can't be blank")
  end 

  it "is invalid without an author" do
    book = Book.new(title: "Test", author: nil)
    book.valid?
    expect(book.errors[:author]).to include("can't be blank")
  end   
end
