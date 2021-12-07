# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/edit', type: :view do

  let(:user) { create(:user) }
  let(:post) { create(:post, created_by: user) }

  before do
    assign(:post, post)
  end

  it 'renders the edit post form' do
    render
    expect(rendered).to include t('posts.edit.title')
    expect(rendered).to render_template(partial: 'posts/_form')
    expect(rendered).to have_link t('posts.edit.show'), href: post_path(post)
    expect(rendered).to have_link t('posts.edit.back'), href: posts_path
  end
end
