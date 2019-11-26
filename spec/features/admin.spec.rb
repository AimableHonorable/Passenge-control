require 'rails_helper'

RSpec.feature "User management", type: :feature do
  background do
    FactoryBot.create(:user, first_name: 'Aimable',
                             last_name: 'Twiringiyimana',
                             email: 'aimable@gmail.com',
                             password: 'password',
                             admin: true
                            )
    visit new_user_session_path
    fill_in 'Email', with: 'aimable@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
  scenario "Test if admin can access administration dashboard" do
    visit passengers_path
    click_link 'Administration'
    expect(page).to have_content 'Site Administration'
  end
  scenario "Test if admin can create user" do
    visit passengers_path
    click_link 'Administration'
    click_link('Users', match: :first)
    click_link 'Add new'
    fill_in 'Email', with: 'aline@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'First name', with: 'Mutoni'
    fill_in 'Last name', with: 'Aline'
    click_button 'Save'
    expect(page).to have_content 'User successfully created'
  end
end
