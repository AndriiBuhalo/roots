require 'rails_helper'

RSpec.describe "attachment/index", type: :view do

  let(:valid_attachment) { create(:attachment) }

  before(:each) do
    assign(:attachment, [valid_attachment])
  end


  it "renders a list of attachments" do
    expect(rendered).to render_template(partial: 'layouts/_left_col')
    expect(rendered).to have_link t('attachment.all media'), href: attachment_index_path
    expect(rendered).to have_link t('+'), href: new_attachment_path
    expect(rendered).to have_link t('album.all albums'), href: album_index_path
    expect(rendered).to have_link t('+'), href: new_album_path
    expect(rendered).to have_link href: attachment_path(valid_attachment)
  end
end
