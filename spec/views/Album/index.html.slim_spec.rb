require 'rails_helper'

RSpec.describe 'album/index', type: :view do
  let(:valid_album) { create(:album) }

  before do
    assign(:albums, [valid_album])
  end

  it 'renders a list of albums' do
    render
    expect(rendered).to have_link t('album.all media'), href: attachment_index_path
    expect(rendered).to have_link t('common.add'), href: new_attachment_path
    expect(rendered).to have_link t('album.all albums'), href: album_index_path
    expect(rendered).to have_link t('common.add'), href: new_album_path
    expect(rendered).to include t('album.name')
    expect(rendered).to include t('album.description')
    expect(rendered).to include valid_album.name
    expect(rendered).to include valid_album.description
    expect(rendered).to have_link href: album_path(valid_album)
  end
end
