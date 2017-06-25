class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

Rails.application.routes.draw do
  root 'static_pages#top'
  # namespaceを個別ファイルに切り分け
  draw :admins
  draw :users
end
