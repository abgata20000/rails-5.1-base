module ActiveHashSupportable
  extend ActiveSupport::Concern

  class_methods do
    def collection
      all.map { |data| [data.name, data.id.to_s] }
    end

    def to_a
      all.map(&:name)
    end

    def to_hash
      Hash[all.map { |data| [data.id, data.name] }]
    end
  end
end
