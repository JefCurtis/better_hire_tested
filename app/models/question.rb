class Question < ActiveRecord::Base
  validates :title, length: { minimum: 5 }
  validates :title, presence: true
  belongs_to :position
  has_many :answers, dependent: :destroy
end
