require 'rails_helper'

RSpec.describe "posts/edit", type: :view do

  let(:valid_post) { create(:post) }

  before(:each) do
    assign(:post, valid_post)
  end

  it "renders the edit post form" do
    render
    expect(rendered).to include t('posts.edit.title')
    expect(rendered).to render_template(partial: 'posts/_form')
    expect(rendered).to have_link t('posts.edit.show'), href: "/posts/#{valid_post.id}"
    expect(rendered).to have_link t('posts.edit.back'), href: posts_path
    end
end

