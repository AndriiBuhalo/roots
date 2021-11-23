require 'rails_helper'

RSpec.describe 'album/new', type: :view do
  let(:valid_album) { create(:album) }

  before do
    assign(:album, [valid_album])
  end

  it 'renders new album form' do
    render
    expect(rendered).to have_link t('common.back')
  end
end
