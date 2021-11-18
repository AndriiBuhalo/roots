require 'rails_helper'

RSpec.describe "attachment/show", type: :view do

  let(:valid_attachment) { create(:attachment) }

  before(:each) do
    assign(:attachment, valid_attachment)
  end

  it "renders show form" do
    render
    expect(rendered).to have_link t('attachment.all media'), href: attachment_index_path
    expect(rendered).to have_link t('common.add'), href: new_attachment_path
    expect(rendered).to have_link t('album.all albums'), href: album_index_path
    expect(rendered).to have_link t('common.add'), href: new_album_path
    expect(rendered).to have_link t('common.edit'), href: edit_attachment_path(valid_attachment)
    expect(rendered).to have_link t('common.back')
    expect(rendered).to have_link t('common.delete'), href: attachment_path(valid_attachment)
  end
end
