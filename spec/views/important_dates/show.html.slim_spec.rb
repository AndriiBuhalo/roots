require 'rails_helper'

RSpec.describe "important_dates/show", type: :view do
  before(:each) do
    @important_date = assign(:important_date, ImportantDate.create!(
      event: "MyText",
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Description/)
  end
end
