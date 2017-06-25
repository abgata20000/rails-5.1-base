class ImageFileUploader < FileAbstractUploader
  include CarrierWave::MiniMagick
  process convert: "jpg"

  process resize_to_limit: [600, 600]
  version :thumb do
    process resize_to_fit: [200, 200]
  end

  def extension_white_list
    %w[jpg jpeg png gif]
  end
end
