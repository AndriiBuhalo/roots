module Breadcrumbs
  extend ActiveSupport::Concern

  included do
    before_action :set_breadcrumbs
    before_action :set_index_breadcrumb, only: %i[show new edit create update]
  end

  def add_breadcrumb(label, path = nil)
    @breadcrumbs.push({ label: label, path: path })
  end

  private

  def set_breadcrumbs
    @breadcrumbs = []
  end

  def set_index_breadcrumb
    add_breadcrumb(t("#{controller_name}.index.breadcrumb"), send("#{controller_name}_path"))
  end
end
