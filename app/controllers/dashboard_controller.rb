class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_exist?, only: :home

  def home
    @requisitions = current_user.requisition
  end

  private

  def profile_exist?
    current_user.profile ? @path = edit_profile_path(current_user.profile.id) : @path = new_profile_path
  end

end