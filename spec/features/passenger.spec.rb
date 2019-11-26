require 'rails_helper'

RSpec.feature "Passenger management", type: :feature do
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

    @user = User.first
    FactoryBot.create(:passenger, first_name: 'Ange',
                                  last_name: 'Mary',
                                  email: 'ange@gmail.com',
                                  phone: '0788908978',
                                  id_number: '1998000088990909',
                                  ref_first_name: 'Honorine',
                                  ref_last_name: 'Mary',
                                  ref_phone_number: '0756675656',
                                  destination: 'Nyarugenge',
                                  entry_on: '2019-11-26',
                                  return_on: '2019-11-30',
                                  user_id: @user.id
                                  )
    FactoryBot.create(:passenger, first_name: 'Favor',
                                  last_name: 'Mwiza',
                                  email: 'favor@gmail.com',
                                  phone: '0788908978',
                                  id_number: '1998880088990909',
                                  ref_first_name: 'Honorine',
                                  ref_last_name: 'Mary',
                                  ref_phone_number: '0756675656',
                                  destination: 'Nyarugenge',
                                  entry_on: '2019-11-26',
                                  return_on: '2019-11-30',
                                  user_id: @user.id
                                  )

end
  scenario "Test if we can register passenger" do
    visit passengers_path
    click_link 'Register passenger'
    fill_in 'First name', with: 'Felix'
    fill_in 'Last name', with: 'Dushime'
    fill_in 'Email', with: 'felix@gmail.com'
    fill_in 'Phone', with: '0788099009'
    fill_in 'Id number', with: '1234567890123456'
    fill_in 'Ref first name', with: 'Aimable'
    fill_in 'Ref last name', with: 'Aima'
    fill_in 'Ref phone number', with: '0782345667'
    select 'Nyarugenge'
    fill_in 'Entry on', with: '2019-11-26'
    fill_in 'Return on', with: '2019-11-30'
    click_button 'Save'
    expect(page).to have_content 'Felix'
  end
  scenario "Test search passenger" do
    visit passengers_path
    fill_in 'Search passenger', with:'Favor'
    click_button 'Search'
    expect(page).to have_content 'Favor'
  end
end
