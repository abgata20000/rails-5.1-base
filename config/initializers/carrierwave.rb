CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],
    region: 'ap-northeast-1',
    path_style: true
  }

  config.fog_public = true

  config.remove_previously_stored_files_after_update = false

  config.fog_directory = ENV['S3_BUCKET']
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/' + ENV['S3_BUCKET']

  config.cache_dir = "#{Rails.root}/tmp/uploads"
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
