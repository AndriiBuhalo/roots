# frozen_string_literal: true

Rails.application.reloader.to_prepare do
  if Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
      # config.enable_processing = false
    end

    # make sure our uploader is auto-loaded
    # rubocop:disable Lint/Void
    FileUploader
    # rubocop:enable Lint/Void
    # use different dirs when testing
    CarrierWave::Uploader::Base.descendants.each do |klass|
      next if klass.anonymous?

      klass.class_eval do
        def cache_dir
          Rails.root.join('spec/support/uploads/tmp')
        end

        def store_dir
          Rails.root.join("spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}")
        end
      end
    end
  end
end
