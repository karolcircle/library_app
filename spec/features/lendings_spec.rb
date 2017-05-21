require 'rails_helper'
DatabaseCleaner.clean

feature "lending books" do
  scenario "Signed in user can borrow and return book" do
    user = FactoryGirl.create(:user)
    book = FactoryGirl.create(:book)
    login_as(user, :scope => :user)
    visit root_path
  
    click_link 'Copies'
    click_button 'Borrow'
    expect(page).to have_button 'Return'
    
    click_button 'Return'
    expect(page).to have_button 'Borrow'
  end

  scenario "Not signed guest must not borrow and return book" do       
    book = FactoryGirl.create(:book)
    visit root_path
    click_link 'Copies'
    expect(page).to have_content 'Sign in'   
  end    
end
