class EmailValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    return false if value.blank?
    unless value.match?(/\A\S+@\S+\.\S+\z/)
      object.errors.add(attribute, :not_email)
      return false
    end
    if not_duplication?(object, attribute, value)
      object.errors.add(attribute, :duplication_email)
      return false
    end
    if exist?(object, attribute, value)
      object.errors.add(attribute, :not_exist_email)
      return false
    end
    true
  end

  private

  def not_duplication?(object, attribute, value)
    scope = scope_class(object)
    key = scope.primary_key
    options[:not_duplication] && !scope.where("#{attribute}": value)
                                       .where.not("#{key}": object[scope.primary_key])
                                       .first.nil?
  end

  def exist?(object, attribute, value)
    scope = scope_class(object)
    options[:exist] &&
      scope.where("#{attribute}": value).first.nil?
  end

  def scope_class(object)
    @scope_class ||= options[:scope] || object.class
  end
end
