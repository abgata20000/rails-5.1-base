class FileAbstractUploader < CarrierWave::Uploader::Base
  include RandomCalcUploaderable
  storage :fog

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
