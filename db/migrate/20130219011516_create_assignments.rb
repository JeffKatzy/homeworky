class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :lesson_id
      t.integer :classroom_id

      t.timestamps
    end
  end
end
