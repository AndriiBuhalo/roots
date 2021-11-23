require 'rails_helper'

RSpec.describe 'attachment/show', type: :view do
  let(:valid_attachment) { create(:attachment) }

  before do
    assign(:attachment, valid_attachment)
  end

  it 'renders show form' do
  end
end
