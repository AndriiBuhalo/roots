require 'rails_helper'

RSpec.feature "Users", type: :feature do
   
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

  it 'User sign in' do
    create(:user, email: "someone@example.tld", password: "somepassword")
    visit ('welcome_pages/home')
    click_link "Log In"
    expect(current_path).to eq(new_user_session_path)

    fill_in "Email", with: "someone@example.tld"
    fill_in "Password", with: "somepassword"
    click_button "Log in"

    expect(current_path).to eq "/"
    expect(page).to have_content('Log Out')

    click_on "Log Out"
    expect(current_path).to eq "/"
    expect(page).to have_content('Sign Up')
  end

  context "Password doesn't confirmation" do

    before do
      visit new_user_registration_path
    end

    it "incorrect password confirmation" do
      fill_in "Email", with: "tester@example.tld"
      fill_in "Password", with: "test-password"
      fill_in "Password confirmation", with: "not-test-password"
      click_button "Sign up"
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
