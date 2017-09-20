class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def is_omniauth
  	current_user.uid ? @type == 1 : @type == 0
  end
end
