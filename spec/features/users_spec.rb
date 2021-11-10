require 'rails_helper'
# require 'factories/user'

RSpec.feature "Users", type: :feature do
  # it 'display' do
  #   user = build(:user)
  #   visit ('welcome_pages/home')
  #   click_link "Sign Up"
  #   expect(page).to have_content('Sign Up')
  #   expect(current_path).to eq(new_user_registration_path)
  #   login_as user, scope: :user 
  # end
   
  it 'User sign up' do
    visit ('welcome_pages/home')
    click_link "Sign up"
    expect(current_path).to eq(new_user_registration_path)

    fill_in "Email", with: "tester@example.tld"
    fill_in "Password", with: "test-password"
    fill_in "Password confirmation", with: "test-password"
    click_button "Sign up"
    expect(current_path).to eq "/"
    expect(page).to have_content('Log Out')
    
  end

end
