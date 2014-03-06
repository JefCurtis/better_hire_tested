class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.datetime :completed_at
      t.references :position, index: true

      t.timestamps
    end
  end
end
