require 'rails_helper'

RSpec.feature "User management", type: :feature do
  background do
    FactoryBot.create(:user, first_name: 'Aimable',
                             last_name: 'Twiringiyimana',
                             email: 'aimable@gmail.com',
                             password: 'password',
                             admin: true
                            )
    # visit new_user_session_path
    # fill_in 'Email', with: 'aimable@gmail.com'
    # fill_in 'Password', with: 'password'
    # click_button 'Log in'
  end
  scenario "Test successful login" do
    visit new_user_session_path
    fill_in 'Email', with: 'aimable@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Register passenger'
  end
  scenario "Test password reset" do
    visit new_user_session_path
    click_link 'Forgot your password?'
    fill_in 'Email', with: 'aimable@gmail.com'
    click_button 'Send me reset password instructions'
    expect(page).to have_content 'パスワード再発行の方法が記載されたメールが間もなく送信されます。'
    # visit letters
    # visit edit_user_password_path
    # save_and_open_page
    # fill_in 'Password', with: 'password'
    # click_button 'Change my password'
  end
end
