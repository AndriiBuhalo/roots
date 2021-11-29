# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'academia-roots@gmail.com'
  layout 'mailer'
end
