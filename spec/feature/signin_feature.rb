require 'rails_helper'
 
feature 'User signs in' do
  given!(:user) { FactoryBot.create(:myuser) }
 
  scenario 'with valid credentials' do
    visit "/myusers/sign_in"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    check 'Remember me'
    click_button 'Log in'
    expect(page).to have_content "Welcome: #{user.email}! Click here for Products\nSigned in successfully."
  end
end
