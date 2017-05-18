require 'rails_helper'
DatabaseCleaner.clean

feature "lending books" do
  scenario "Borrow and Return book" do
    visit root_path
    click_link 'New Book'
    fill_in 'Title', with: 'Title'
    fill_in 'Author', with: 'Author'
    click_button 'Create Book'

    visit root_path
    click_link 'Copies'
    click_button 'Borrow'   
    expect(page).to have_button 'Return'
    click_button 'Return'
    expect(page).to have_button 'Borrow'
  end  
end