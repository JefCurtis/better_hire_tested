class AddImageToCandidate < ActiveRecord::Migration
  def change
    add_attachment :candidates, :avatar

  end
end
