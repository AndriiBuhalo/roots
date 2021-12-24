# class AttachmentPolicy::Scope
# frozen_string_literal: true

class AttachmentPolicy < ApplicationPolicy
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
