# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/index', type: :view do
  let(:valid_post) { create(:post) }

  before do
    assign(:posts, [valid_post])
  end

  it 'renders a list of posts' do
    render
    expect(rendered).to include valid_post.title
    expect(rendered).to include valid_post.content
    expect(rendered).to have_link t('posts.index.edit'), href: edit_post_path(valid_post)
    expect(rendered).to have_link t('posts.index.destroy'), href: post_path(valid_post)
  end
end
