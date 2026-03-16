class Api::V1::QuestionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.new(question_params.merge(user_id: current_user.id))
    if @question.save
      render json: Api::V1::QuestionSerializer.new(@question).serializable_hash, status: :created
    else
      render json: { errors: @question.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
