class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :interview
  validates :title, presence: true
  validates :interview_id, presence: true
  validates :question_id, presence: true
  validates_uniqueness_of :question_id, scope: :interview_id
  

end