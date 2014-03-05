class AddCandIdToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :cand_id, :integer
  end
end
