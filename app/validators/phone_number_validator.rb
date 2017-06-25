class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    return if value.blank?
    # HACK: 結構適当
    return unless value !~ /^[0-9]+[0-9-]*[0-9]$/
    object.errors[attribute] << I18n.t('errors.messages.not_phone_number')
  end
end
