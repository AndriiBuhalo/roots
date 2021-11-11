require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  let(:valid_post) { create(:post) }

  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "12wkndwkdw",
        content: "knklqxkwqnxklqnwxkwnxkwnxkwlxnksxsxnkwsxknxnswknlwnklxsklknnkl",
        id: 1
      )])
  end


  it "renders a list of posts" do
    render
    expect(rendered).to include t('posts.index.main_title')
    expect(rendered).to include t('posts.index.title')
    expect(rendered).to include t('posts.index.content')
    expect(rendered).to match(/12wkndwkdw/)
    expect(rendered).to match(/knklqxkwqnxklqnwxkwnxkwnxkwlxnksxsxnkwsxknxnswknlwnklxsklknnkl/)
    expect(rendered).to have_link t('posts.index.show'), href: post_path(1)
    expect(rendered).to have_link t('posts.index.edit'), href: edit_post_path(1)
    expect(rendered).to have_link t('posts.index.destroy'), href: "/posts/1"
    expect(rendered).to have_link t('posts.index.new_post'), href: "/posts/new"
  end
end
