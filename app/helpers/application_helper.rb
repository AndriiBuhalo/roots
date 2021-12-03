# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(name)
    { success: 'alert-success',
      error: 'alert-danger',
      danger: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info' }[name.to_sym] || name
  end

  def current_locale?(locale)
    I18n.locale == locale
  end

  def locale_switcher(locale)
    "global.header.#{locale}_switch"
  end
end
