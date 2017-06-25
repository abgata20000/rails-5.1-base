class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  extend Enumerize

  # 人が読んで分かりやすい呼び名
  def human_readable_name
    %w[name title].each do |name|
      return send(name) if respond_to?(name)
    end
    nil
  end

  # viewでsendするときに空気読んでくれる
  def send_for_view(name)
    case send(name)
    when Enumerize::Value
      send(name).text
    when ActiveSupport::TimeWithZone
      I18n.l send(name)
    else
      send(name)
    end
  end

  def label
    I18n.t("activerecord.models.#{self.class.name.underscore}")
  end
end
