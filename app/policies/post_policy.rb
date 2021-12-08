class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.admin?
        scope.all
      else
        scope.where(created_by: @user.try(:id))
      end
    end
  end

  def index?
    @record.each do |record|
      @user.id == record.created_by_id || @user.admin?
    end
  end

  def new?
    user_is_owner_of_record?
  end

  def create?
    user_is_owner_of_record?
  end

  def show?
    user_is_owner_of_record?
  end

  def update?
    user_is_owner_of_record?
  end

  def destroy?
    user_is_owner_of_record?
  end

  def user_is_owner_of_record?
    @user.id == @record.created_by_id || @user.admin?
  end
end
