class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :movie_id
  has_many :answers
  belongs_to :movie
  has_one :movie
end
