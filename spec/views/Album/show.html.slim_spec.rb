require 'rails_helper'

RSpec.describe 'album/show', type: :view do
  let(:valid_album) { create(:album) }

  before do
    assign(:album, valid_album)
  end

  it 'renders show form' do
    render
    expect(rendered).to have_link t('album.all media'), href: attachment_index_path
    expect(rendered).to have_link t('common.add'), href: new_attachment_path
    expect(rendered).to have_link t('album.all albums'), href: album_index_path
    expect(rendered).to have_link t('common.add'), href: new_album_path
    expect(rendered).to include valid_album.name
    expect(rendered).to include valid_album.description
    expect(rendered).to have_link t('common.edit'), href: edit_album_path(valid_album)
    expect(rendered).to have_link t('common.back')
    expect(rendered).to have_link t('common.delete'), href: album_path(valid_album)
  end
end
