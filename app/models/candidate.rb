class Candidate < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, :address, presence: :true
  validates :email, uniqueness: :true

end
