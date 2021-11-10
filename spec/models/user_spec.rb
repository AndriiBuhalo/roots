require 'rails_helper'

RSpec.describe User, type: :model do

  it "validation the name and makes sure it's not empty" do
    user = User.new(username: '')
    user.valid?
    user.errors[:username].should_not be_empty
  end

  # it { should have_db_column(:email).of_type(:string) }
  # it { should have_db_column(:encrypted_password).of_type(:string) }
  # it { should have_db_column(:reset_password_token).of_type(:string) }
  # it { should have_db_column(:remember_created_at).of_type(:datetime) }
end
