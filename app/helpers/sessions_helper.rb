module SessionsHelper
  # 1.@current_userに値がなければDBから取得する
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  # 2.1で取得した@current_userに値が入っているかどうかをt or fで返す
  def logged_in?
    !!current_user
  end
end
