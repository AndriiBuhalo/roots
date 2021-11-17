require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:encrypted_password).of_type(:string) }
  it { should have_db_column(:reset_password_token).of_type(:string) }
  it { should have_db_column(:remember_created_at).of_type(:datetime) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  it { should validate_length_of(:password).is_at_least(6).is_at_most(128).on(:create)}
  it { should validate_length_of(:email).is_at_most(45)}

end
