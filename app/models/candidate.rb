class Candidate < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, :address, presence: :true
  validates :email, uniqueness: :true
  belongs_to :position

  scope :all_but, lambda { |ids| where("position_id not in (?) OR position_id IS NULL", ids) }

  # scope :without_position, lambda { where(position_id: nil) }

  

  def name
    "#{first_name} #{last_name}".strip
  end

  def has_position?
    position
  end
end
