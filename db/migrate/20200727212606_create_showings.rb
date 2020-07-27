class CreateShowings < ActiveRecord::Migration[6.0]
  def change
    create_table :showings do |t|
      t.integer :movie_id
      t.datetime :time

      t.timestamps
    end
  end
end
