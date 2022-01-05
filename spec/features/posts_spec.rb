# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, created_by: user) }

  before do
    sign_in(user)
    visit('/posts')
  end

  context 'when creating a post' do
    it 'creates' do
      click_link 'New Post'
      fill_in 'Title', with: 'Test title'
      fill_in 'Content', with: 'Test content'
      click_button 'Submit'
      expect(page).to have_content('Post was successfully created')
    end

    it 'does not create' do
      click_link 'New Post'
      fill_in 'Title', with: 'Test title'
      fill_in 'Content', with: ''
      click_button 'Submit'
      expect(page).to have_content("Content can't be blank and Content is too short (minimum is 5 characters)")
    end
  end

  context 'when updating a post' do
    it 'updates' do
      visit edit_post_path(post)
      fill_in 'Title', with: 'Test title'
      fill_in 'Content', with: 'Test content'
      click_button 'Submit'
      expect(page).to have_content('Post was successfully updated')
    end

    it 'does not update' do
      visit edit_post_path(post)
      fill_in 'Title', with: 'Test title'
      fill_in 'Content', with: ''
      click_button 'Submit'
      expect(page).to have_content("Content can't be blank and Content is too short (minimum is 5 characters)")
    end
  end

  it 'show post' do
    visit posts_path(post)
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.content)
  end
end
