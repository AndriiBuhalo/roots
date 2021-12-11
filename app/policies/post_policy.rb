# class PostPolicy::Scope
# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.admin?
        scope.all
      else
        scope.by_user(@user)
      end
    end
  end

  def show?
    user_is_owner_of_record_or_admin?
  end

  def update?
    user_is_owner_of_record_or_admin?
  end

  def destroy?
    user_is_owner_of_record_or_admin?
  end

  def user_is_owner_of_record_or_admin?
    @user == @record.created_by || @user.admin?
  end
end
