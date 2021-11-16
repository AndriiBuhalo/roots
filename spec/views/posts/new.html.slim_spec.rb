require 'rails_helper'

RSpec.describe "posts/new", type: :view do

  let(:valid_post) { build(:post) }

  before(:each) do
    assign(:post, valid_post)
  end

  it "renders new post form" do
    render
    expect(rendered).to include t('posts.new.title')
    expect(rendered).to render_template(partial: 'posts/_form')
    expect(rendered).to have_link t('posts.new.back'), href: posts_path
  end

end