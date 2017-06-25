module Scaffoldable
  module PrivateMethods
    private

    def model
      controller_name.camelize.singularize.constantize
    end

    def find_model_instance
      model.find(params[:id])
    end

    def model_instance
      instance_variable_get("@#{controller_name.singularize}".to_sym)
    end

    def to_model_instance
      instance_variable_set(
        "@#{controller_name.singularize}".to_sym,
        find_model_instance
      )
    end

    def model_instances
      instance_variable_get("@#{controller_name.pluralize}".to_sym)
    end

    def model_instance_create
      model_instance.save
    end

    def model_instance_update
      model_instance.update(controller_params)
    end

    def model_instance_destroy
      model_instance.destroy
    end

    def new_model_instance(my_params = nil)
      instance_variable_set(
        "@#{controller_name.singularize}".to_sym,
        new_model(my_params)
      )
    end

    def new_model(params = nil)
      params.nil? ? model.new : model.new(params)
    end

    def to_model_instances(resources = nil)
      instance_variable_set(
        "@#{controller_name.pluralize}".to_sym,
        resources
      )
    end

    def index_resources
      model
    end

    def resources_includes
      []
    end

    def resources_wheres(resources = nil)
      resources
    end

    def resources_paginate(resources = nil)
      return nil if resources.nil?
      resources.page(params[:page])
    end

    def controller_params
      send("#{controller_name.singularize}_params")
    end

    def controller_sym
      controller_name.singularize.to_sym
    end

    def human_readable_now_model_name
      model.model_name.human
    end

    def relation_model_symbol
      :user_id
    end

    def call_relation_model
      current_user
    end

    def relation_model_instance_setting
      return if relation_model_symbol.nil?
      return unless model_instance.has_attribute?(relation_model_symbol) &&
                    model_instance.send(relation_model_symbol).nil?
      return if call_relation_model.nil?
      model_instance.send("#{relation_model_symbol}=", call_relation_model.id)
    end
  end
end
