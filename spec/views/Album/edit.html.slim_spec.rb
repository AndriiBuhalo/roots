require 'rails_helper'

RSpec.describe 'album/edit', type: :view do
  let(:valid_album) { create(:album) }

  before do
    assign(:album, valid_album)
  end

  it 'renders the edit album form' do
    render
    expect(rendered).to have_link t('common.back')
  end
end
