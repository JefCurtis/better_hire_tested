class AddInterviewIdToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :interview, index: true
  end
end
