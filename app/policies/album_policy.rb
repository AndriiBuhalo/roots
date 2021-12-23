# class AlbumPolicy::Scope
# frozen_string_literal: true

class AlbumPolicy < ApplicationPolicy
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

  def add_attachment_to_album?
    user_is_owner_of_record_or_admin?
  end
end
