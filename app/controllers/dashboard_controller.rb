class DashboardController < ApplicationController
  before_action :authenticate_user!

  def home
    profile_exist?
    @requisitions = current_user.requisition
    @movies = Facebook.get_object(current_user.token, '/me?fields=id,first_name,last_name,bitrhday')
  end

  private

  def profile_exist?
    current_user.profile ? @path = edit_profile_path(current_user.profile.id) : @path = new_profile_path
  end

end