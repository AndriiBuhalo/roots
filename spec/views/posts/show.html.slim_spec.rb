# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  let(:user) { create(:user) }
  let(:post) { create(:post, created_by: user) }

  before do
    assign(:post, post)
  end

  it 'renders show form' do
    render
    expect(rendered).to include t('posts.show.title')
    expect(rendered).to include post.title
    expect(rendered).to include t('posts.show.content')
    expect(rendered).to include post.content
    expect(rendered).to have_link t('posts.show.edit'), href: edit_post_path(post)
    expect(rendered).to have_link t('posts.show.back'), href: posts_path
  end
end
