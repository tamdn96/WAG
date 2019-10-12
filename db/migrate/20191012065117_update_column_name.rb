class UpdateColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :desc, :description
    add_column :events, :title, :string
  end
end
