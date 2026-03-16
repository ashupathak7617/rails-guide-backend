class Api::V1::CommentsController < ApplicationController

  def create
   @comment = Comment.new(comment_pamars.merge(user_id: current_user.id))
   if @comment.save
    render json: { message: "Comment created successfully"}
    else
      render json: {error: @comment.errors.full_messages}
    end
  end

  private

  def comment_pamars
    params.permit(:body, :commentable_id, :commentable_type)
  end
end