# class AttachmentPolicy::Scope
# frozen_string_literal: true

class AttachmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.admin?
        scope.all
      else
        scope.where(created_by: @user)
      end
    end
  end

  def index?
    true
  end

  def show?
    user_is_owner_of_record_or_admin?
  end

  def create?
    user_is_owner_of_record_or_admin?
  end

  def new?
    create?
  end

  def update?
    user_is_owner_of_record_or_admin?
  end

  def edit?
    update?
  end

  def destroy?
    user_is_owner_of_record_or_admin?
  end

  def user_is_owner_of_record_or_admin?
    @user == @record.created_by || @user.admin?
  end
end
