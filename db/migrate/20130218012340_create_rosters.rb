class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :classroom_id
      t.integer :student_id

      t.timestamps
    end
  end
end
