require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  let(:valid_post) { create(:post) }

  before(:each) do
    assign(:post, valid_post)
  end

  it "renders show form" do
    render
    expect(rendered).to include t('posts.show.title')
    expect(rendered).to include valid_post.title
    expect(rendered).to include t('posts.show.content')
    expect(rendered).to include valid_post.content
    expect(rendered).to have_link t('posts.show.edit'), href: edit_post_path(valid_post)
    expect(rendered).to have_link t('posts.show.back'), href: posts_path
  end
end
