# frozen_string_literal: true

class WelcomePagesController < ApplicationController
  layout 'public'
  def home
    set_meta_tags title: t('welcome_pages.home.page_title')
  end

  def about
    set_meta_tags title: t('welcome_pages.about.page_title')
  end

  def contacts
    set_meta_tags title: t('welcome_pages.contacts.page_title')
  end
end
