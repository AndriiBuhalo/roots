# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, title: 'some title', content: 'some content', created_by: user) }

  before(:each) do
    sign_in(user)
    visit('/posts')
  end

  context 'Create post' do

    scenario 'should create' do
      click_link 'New Post'
      fill_in 'Title', with: 'Test title'
      fill_in 'Content', with: 'Test content'
      click_button 'Submit'
      expect(page).to have_content('Post was successfully created')
    end

    scenario "shouldn't create" do
      click_link 'New Post'
      fill_in 'Title', with: 'Test title'
      fill_in 'Content', with: ''
      click_button 'Submit'
      expect(page).to have_content("Content can't be blank and Content is too short (minimum is 5 characters)")
    end
  end

  context 'Update post' do

    scenario 'should update' do
      visit edit_post_path(post)
      fill_in 'Title', with: 'Test title'
      fill_in 'Content', with: 'Test content'
      click_button 'Submit'
      expect(page).to have_content('Post was successfully updated')
    end
  end

    scenario "shouldn't update" do
      visit edit_post_path(post)
      fill_in 'Title', with: 'Test title'
      fill_in 'Content', with: ''
      click_button 'Submit'
      expect(page).to have_content("Content can't be blank and Content is too short (minimum is 5 characters)")
    end


    it 'show post' do
      visit posts_path(post)
      expect(page).to have_content('some title')
      expect(page).to have_content('some content')
    end
end
