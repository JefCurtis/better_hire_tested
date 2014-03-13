class Candidate < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, :address, presence: :true
  validates :email, uniqueness: :true
  # belongs_to :position
  # has_many :answers
  has_many :interviews, dependent: :destroy
  has_many :positions, through: :interviews
  has_many :answers, through: :interviews

  has_attached_file :avatar, 
                    styles: { large: "800X800>", medium: "300x300>", thumb: "150x150>" }, 
                    default_url: ActionController::Base.helpers.asset_path('missing_avatar.png')

  validates_attachment_size :avatar, less_than: 10.megabytes
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }


  scope :all_but, lambda { |ids| where("position_id not in (?) OR position_id IS NULL", ids) }
  scope :with_template_assigned, -> { where("position_id IS NOT NULL") }
  scope :with_no_template, -> { where("position_id IS NULL") }

  def formatted_name
    if first_name.nil? || last_name.nil?
    email
    else
      "#{first_name.capitalize} #{last_name.capitalize}".strip
    end
  end

  def interview_progress
    if position.questions.count > 0 && answers.count > 0
      (answers.count.to_f / position.questions.count.to_f) * 100
    else
      0
    end
  end

  def has_position?
    position
  end
end
