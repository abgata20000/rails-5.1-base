module Scaffoldable
  extend ActiveSupport::Concern

  included do
    include ScaffoldableHelper
    before_action :to_model_instance, only: %w[show edit update destroy]
  end

  module ClassMethods
    def local_prefixes
      super + ['scaffoldable']
    end
  end

  include ActionMethods
  include PrivateMethods
  include ProcessMethods
  include AfterMethods
end
