class UsersController < ApplicationController
before_action :user_is_current_user

  def show
    @user = current_user
  end

  private

  def user_is_current_user
    unless current_user.id == params[:id].to_i
      redirect_to root_path
    end
  end
end
