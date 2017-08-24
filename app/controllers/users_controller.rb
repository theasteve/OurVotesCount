class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @protests = @user.protests
  end
end
