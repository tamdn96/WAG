class AddColumnsToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :image_detect, :string
    add_column :reports, :status_detect, :integer
  end
end
