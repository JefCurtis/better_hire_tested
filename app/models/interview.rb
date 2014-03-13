class Interview < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :position
  has_many :answers
  validates :position_id, :uniqueness => { :message => "The position has already been assigned to the candidate" }

  def interview_progress
    if position.questions.count > 0 && answers.count > 0
      ((answers.count.to_f / position.questions.count.to_f) * 100).floor
    else
      0
    end
  end

  def interview_score
    total_score = 0.0
    total_rated = 0.0
    position.questions.each do |question|
      question.answers.each do |answer|
        if answer.rating? 
          total_score += answer.rating
          total_rated += 1 
        end
      end
    end
     score = total_score / total_rated
     (score * 2.0).round / 2.0
  end
end
