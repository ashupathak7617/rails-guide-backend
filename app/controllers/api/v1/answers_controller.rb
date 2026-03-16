class Api::V1::AnswersController < ApplicationController

  def create
   @answer = Answer.new(answer_pamars.merge(user_id: current_user.id))
   if @answer.save
    render json: Api::V1::AnswerSerializer.new(@answer)
    else
      render json: {error: answer.errors.full_messages}
    end
  end

  private

  def answer_pamars
    params.permit(:body, :question_id)
  end
end