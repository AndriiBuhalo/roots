require 'rails_helper'

RSpec.describe "album/show", type: :view do

  let(:valid_album) { create(:album) }

  before(:each) do
    assign(:album, [valid_album])
  end

  it "renders show form" do
    render
    expect(rendered).to render_template(partial: 'layouts/_left_col')
    expect(rendered).to have_link t('attachment.all media'), href: attachment_index_path
    expect(rendered).to have_link t('+'), href: new_attachment_path
    expect(rendered).to have_link t('attachment.all albums'), href: album_index_path
    expect(rendered).to have_link t('+'), href: new_album_path
    expect(rendered).to include valid_album.name
    expect(rendered).to include valid_album.description
    expect(rendered).to have_link t('common.edit'), href: edit_album_path(valid_album)
    expect(rendered).to have_link t('common.back'), href: album_index_path
    expect(rendered).to have_link t('common.delete'), href: album_path(valid_album)
    expect(rendered).to have_link t('album.add picture'), href: new_attachment_path
  end
end
