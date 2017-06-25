class AlphaNumericValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    return if value.blank?
    return unless value !~ /^[a-zA-Z0-9]+$/
    object.errors[attribute] << I18n.t('errors.messages.not_alpha_numeric')
  end
end
