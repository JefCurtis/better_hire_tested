class Candidate < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, :address, presence: :true
  validates :email, uniqueness: :true
  belongs_to :position
  has_attached_file :avatar, 
                    styles: { large: "800X800>", medium: "300x300>", thumb: "150x150>" }, 
                    default_url: ActionController::Base.helpers.asset_path('missing_avatar.png')

  validates_attachment_size :avatar, less_than: 10.megabytes
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }


  scope :all_but, lambda { |ids| where("position_id not in (?) OR position_id IS NULL", ids) }

  def name
    "#{first_name} #{last_name}".strip
  end

  def has_position?
    position
  end
end
# has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
#   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/