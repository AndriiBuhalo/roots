require 'rails_helper'

RSpec.describe "album/edit", type: :view do

  let(:valid_album) { create(:album) }

  before(:each) do
    assign(:album, [valid_album])
  end

  it "renders the edit album form" do
    expect(rendered).to render_template(partial: 'layouts/_left_col')
    expect(rendered).to have_link t('attachment.all media'), href: attachment_index_path
    expect(rendered).to have_link t('+'), href: new_attachment_path
    expect(rendered).to have_link t('attachment.all albums'), href: album_index_path
    expect(rendered).to have_link t('+'), href: new_album_path
    expect(rendered).to include t('.edit album')
    expect(rendered).to have_link t('common.edit'), href: album_path(valid_album)
    expect(rendered).to have_link t('common.back'), href: album_path
    end
end
