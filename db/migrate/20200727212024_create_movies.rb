class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :url
      t.integer :user_id
      t.boolean :is_mature
      t.string :acceptance_status

      t.timestamps
    end
  end
end
