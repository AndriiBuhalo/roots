# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/index', type: :view do

  let(:user) { create(:user) }
  let(:post) { create(:post, created_by: user) }

  before do
    assign(:posts, [post])
  end

  it 'renders a list of posts' do
    allow(view).to receive_messages(will_paginate: nil)
    render
    expect(rendered).to include t('posts.index.main_title')
    expect(rendered).to include t('posts.index.title')
    expect(rendered).to include t('posts.index.content')
    expect(rendered).to include post.title
    expect(rendered).to include post.content
    expect(rendered).to have_link t('posts.index.show'), href: post_path(post)
    expect(rendered).to have_link t('posts.index.edit'), href: edit_post_path(post)
    expect(rendered).to have_link t('posts.index.destroy'), href: post_path(post)
    expect(rendered).to have_link t('posts.index.new_post'), href: new_post_path
  end
end
