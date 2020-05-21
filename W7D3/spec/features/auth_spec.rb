require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do
    visit new_user_path
  end

  scenario 'has a new user page' do
    expect(page).to have_content 'Sign up'
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      fill_in 'Username', with: 'asdf'
      fill_in 'Email', with: 'asdf@asdf.com'
      fill_in 'Password', with: 'asdfasdf'
      click_button 'Submit'
      expect(page).to have_content 'asdf'
    end

  end
end

feature 'logging in' do
  
  background :each do
    visit new_user_path
    fill_in 'Username', with: 'asdf'
    fill_in 'Email', with: 'asdf@asdf.com'
    fill_in 'Password', with: 'asdfasdf'
    click_button 'Submit'

    visit new_session_path
    fill_in 'Username', with: 'asdf'
    fill_in 'Password', with: 'asdfasdf'
    click_button 'Login'
  end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content 'asdf'
  end

end

feature 'logging out' do

  scenario 'begins with a logged out state' do
    visit new_user_path
    expect(page).to have_content 'Login'
    expect(page).to_not have_content 'Logout'
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_user_path
    fill_in 'Username', with: 'asdf'
    fill_in 'Email', with: 'asdf@asdf.com'
    fill_in 'Password', with: 'asdfasdf'
    click_button 'Submit'

    visit new_session_path
    fill_in 'Username', with: 'asdf'
    fill_in 'Password', with: 'asdfasdf'
    click_button 'Login'

    click_button 'Logout'
    expect(page).to_not have_content 'asdf'
  end

end