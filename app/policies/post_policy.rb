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

  def index?
    @record.each do |record|
      @user == record.created_by || @user.admin?
    end
  end

  def new?; end

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
    @user == @record.created_by || @user.admin?
  end
end
