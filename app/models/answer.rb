class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :candidate
  validates :title, presence: true
  validates :candidate_id, presence: true
  validates :question_id, presence: true

  

end