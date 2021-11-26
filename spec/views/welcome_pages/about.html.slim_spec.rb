# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome_pages/about.html.slim', type: :view do

  it 'has _about partial' do
    render
    expect(rendered).to include t('welcome_pages.about.title')
    expect(rendered).to include t('welcome_pages.about.subtitle')
    expect(rendered).to have_css('.card', count: 3)
    expect(rendered).to include t('welcome_pages.about.family_tree_title')
    expect(rendered).to include t('welcome_pages.about.family_tree_paragraph')
    expect(rendered).to include t('welcome_pages.about.personal_posts_title')
    expect(rendered).to include t('welcome_pages.about.personal_posts_paragraph')
    expect(rendered).to include t('welcome_pages.about.photo_albums_title')
    expect(rendered).to include t('welcome_pages.about.photo_albums_paragraph')
  end

end
