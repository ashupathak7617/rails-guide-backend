module Api
  module V1
    class QuestionSerializer
      include JSONAPI::Serializer

      attributes :id, :title, :description, :views_count, :answers_count, :likes_count
    end
  end
end
