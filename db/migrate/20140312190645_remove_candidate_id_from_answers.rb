class RemoveCandidateIdFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :candidate_id
  end
end
