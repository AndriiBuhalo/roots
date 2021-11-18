require 'rails_helper'

RSpec.describe "attachment/new", type: :view do

  let(:valid_attachment) { create(:attachment) }

  before(:each) do
    assign(:attachment, [valid_attachment])
  end

  it "renders new attachment form" do
  end

end
