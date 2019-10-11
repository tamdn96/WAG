class RenameColumnLatLong < ActiveRecord::Migration[5.2]
  def change
    rename_column :positions, :lat, :latitude
    rename_column :positions, :long, :longitude
  end
end
