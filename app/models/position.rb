class Position < ActiveRecord::Base
  validates :name, presence: true
  has_many :questions
  has_many :candidates
  has_many :interviews
  has_many :candidates, through: :interviews



end
