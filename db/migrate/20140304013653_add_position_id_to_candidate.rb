class AddPositionIdToCandidate < ActiveRecord::Migration
  def change
    add_reference :candidates, :position, index: true
  end
end
