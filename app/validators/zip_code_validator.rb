class ZipCodeValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    return if value.blank?
    return unless value !~ /^[0-9]{3}-?[0-9]{4}$/
    object.errors[attribute] << I18n.t('errors.messages.not_zip_code')
  end
end
