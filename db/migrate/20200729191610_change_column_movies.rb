class ChangeColumnMovies < ActiveRecord::Migration[6.0]
  def change
    change_column_default :movies, :acceptance_status, "pending"
  end
end
