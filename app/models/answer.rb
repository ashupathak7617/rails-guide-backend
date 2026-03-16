class Answer < ApplicationRecord
  belongs_to :question, counter_cache: true
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
end
