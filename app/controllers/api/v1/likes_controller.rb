class Api::V1::LikesController < ApplicationController
  def create
    @like = Like.new(like_params.merge(user_id: current_user.id))
    if @like.save
      render json: { message: "Like created success fully "}
    else
      render json: { errors: @like.errors.full_messages}
    end
  end

  private

  def like_params
    params.permit(:likeable_type, :likeable_id)
  end
end