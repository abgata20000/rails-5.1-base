module SessionsHelper
  def current_user
    return @current_user if @current_user
    @current_user = User.find_by(id: session[:user_id])
    @current_user
  end

  def login(user)
    session[:user_id] = user.try(:id)
    @current_user = user
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
  end

  def logged_in?
    current_user.present?
  end

  # アクティブ自治体
  def current_city
    current_user.city
  end
end
