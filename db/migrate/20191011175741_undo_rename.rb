class UndoRename < ActiveRecord::Migration[5.2]
  def change
    rename_table :locations, :positions
  end
end
