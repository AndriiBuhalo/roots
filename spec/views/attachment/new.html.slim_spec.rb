require 'rails_helper'

RSpec.describe "attachment/new", type: :view do

  let(:valid_attachment) { create(:attachment) }

  before(:each) do
    assign(:attachment, [valid_attachment])
  end

  it "renders new attachment form" do
    expect(rendered).to render_template(partial: 'layouts/_left_col')
    expect(rendered).to have_link t('attachment.all media'), href: attachment_index_path
    expect(rendered).to have_link t('+'), href: new_attachment_path
    expect(rendered).to have_link t('album.all albums'), href: album_index_path
    expect(rendered).to have_link t('+'), href: new_album_path
    expect(rendered).to include t('attachment.add pictures')
    expect(rendered).to have_link t('common.edit'), href: attachment_path(valid_attachment)
    expect(rendered).to have_link t('common.back'), href: attachment_index_path
  end

end
