class UsersController < ApplicationController
  before_action :user_params

  def create
    user = User.new(user_params)
    user.save
    user
  end

  private

  def user_params
    params.permit(:name, :email, :passwrod, :bio)
  end
end
