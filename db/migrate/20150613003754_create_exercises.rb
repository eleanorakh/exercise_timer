class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :workout_id, null: false
      t.string :name, null: false
      t.integer :duration, null: false

      t.timestamps null: false
    end
  end
end
