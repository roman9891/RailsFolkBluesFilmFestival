class ChangeColumnInShowing < ActiveRecord::Migration[6.0]
  def change
    change_column :showings, :time, :date
  end
end
