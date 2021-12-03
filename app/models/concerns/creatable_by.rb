module CreatableBy
  extend ActiveSupport::Concern
  included do
    belongs_to :created_by, class_name: 'User'
    scope :by_user, ->(user) { where(created_by: user) }
  end
end
