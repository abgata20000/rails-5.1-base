module Scaffoldable
  module AfterMethods
    private

    def index_path
      url_for(action: :index)
    end

    def show_path
      if begin
        url_for(action: :show, id: model_instance.id)
      rescue
        false
      end
        url_for(action: :show, id: model_instance.id)
      elsif begin
        url_for(action: :edit, id: model_instance.id)
      rescue
        false
      end
        url_for(action: :edit, id: model_instance.id)
      else
        url_for(action: :index)
      end
    end

    def after_index
    end

    def after_show
    end

    def after_destroy
    end

    def url_after_creating
      show_path
    end

    def after_succeeded_creating
    end

    def after_failed_creating
    end

    def url_after_updating
      show_path
    end

    def url_after_destroyed
      index_path
    end

    def render_index(options = {})
      render :index, options
    end

    def render_new(options = {})
      render :new, options
    end

    def render_edit(options = {})
      render :edit, options
    end

    def render_show(options = {})
      render :show, options
    end

    def after_succeeded_updating
    end

    def render_succeeded_creating
      redirect_to url_after_creating, notice: message_successfully_created
    end

    def after_failed_updating
    end

    def render_failed_creating
      render_new
    end

    def render_succeeded_updating
      redirect_to url_after_updating, notice: message_successfully_updated
    end

    def render_failed_updating
      render_edit
    end

    def after_succeeded_destroying
      redirect_to url_after_destroyed, notice: message_successfully_destroyed
    end

    def message_successfully_created
      t('you_successfully_created', name: human_readable_now_model_name)
    end

    def message_successfully_updated
      t('you_successfully_updated', name: human_readable_now_model_name)
    end

    def message_successfully_destroyed
      t('you_successfully_destroyed', name: human_readable_now_model_name)
    end

    def message_successfully_duplicated
      t('you_successfully_duplicated', name: human_readable_now_model_name)
    end
  end
end
