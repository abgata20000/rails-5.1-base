module Scaffoldable
  module ActionMethods
    def index
      process_index
      after_index
      render_index
    end

    def show
      after_show
      render_show
    end

    def new
      process_new
      render_new
    end

    def edit
      render_edit
    end

    def create
      process_create
    end

    def update
      process_update
    end

    def destroy
      process_destroy
    end
  end
end
