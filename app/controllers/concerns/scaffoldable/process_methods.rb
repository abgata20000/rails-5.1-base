module Scaffoldable
  module ProcessMethods
    private

    def process_index
      @search = index_resources.ransack(params[:q])
      if params.key?(:q)
        @search.sorts = 'id desc' if @search.sorts.empty?
        to_model_instances(@search.result.page(params[:page]))
      else
        resources = index_resources
        resources = resources_wheres(resources)
        resources = resources_paginate(resources)
        resources = resources.includes(*resources_includes) if resources_includes.present?
        to_model_instances(resources)
      end
    end

    def process_new
      new_model_instance
    end

    def process_create
      new_model_instance(controller_params)
      # ログインユーザー情報の付与
      relation_model_instance_setting
      if model_instance_create
        after_succeeded_creating
        render_succeeded_creating
      else
        after_failed_creating
        render_failed_creating
      end
    end

    def process_update
      if model_instance_update
        after_succeeded_updating
        render_succeeded_updating
      else
        after_failed_updating
        render_failed_updating
      end
    end

    def process_destroy
      model_instance_destroy
      after_succeeded_destroying
    end
  end
end
