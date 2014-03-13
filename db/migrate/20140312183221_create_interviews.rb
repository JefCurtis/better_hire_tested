class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.references :candidate, index: true
      t.references :position, index: true

      t.timestamps
    end
  end
end
