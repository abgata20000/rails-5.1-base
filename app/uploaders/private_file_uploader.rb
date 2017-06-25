class PrivateFileUploader < FileAbstractUploader
  def fog_public
    false
  end
end
