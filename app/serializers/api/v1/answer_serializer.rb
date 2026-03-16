class Api::V1::AnswerSerializer
  include JSONAPI::Serializer

  attribute :id, :body
end