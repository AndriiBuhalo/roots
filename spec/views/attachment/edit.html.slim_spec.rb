require 'rails_helper'

RSpec.describe "attachment/edit", type: :view do

  let(:valid_attachment) { create(:attachment) }

  before(:each) do
    assign(:attachment, [valid_attachment])
  end

  it "renders the edit attachment form" do
    render
    expect(rendered).to have_link t('common.back')
  end
end
