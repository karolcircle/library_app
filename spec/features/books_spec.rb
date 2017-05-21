require 'rails_helper'
DatabaseCleaner.clean

feature "adding books" do
  scenario "Signed in user can add book" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit root_path
    click_link 'New Book'
    fill_in 'Title', with: 'James Bond Story'
    fill_in 'Author', with: 'You only live twice'
    click_button 'Create Book'

    expect(page).to have_content 'James Bond Story'
    expect(page).to have_content 'You only live twice'
  end

  scenario "Not signed guest must not add book" do       
    visit root_path
    click_link 'New Book'
    expect(page).to have_content 'Sign in'   
  end    
end
