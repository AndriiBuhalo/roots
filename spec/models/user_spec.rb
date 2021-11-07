require 'rails_helper'

RSpec.describe User, type: :model do

  it "validation the name and makes sure it's not empty" do
    user = User.new(username: '')
    user.valid?
    user.errors[:username].should_not be_empty
  end

end
