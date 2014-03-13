class Question < ActiveRecord::Base
  validates :title, length: { minimum: 5 }
  validates :title, presence: true
  belongs_to :position
  has_many :answers, dependent: :destroy

  def answer_for_interview(interview)
    answers.where(interview_id: interview).first
  end

end
