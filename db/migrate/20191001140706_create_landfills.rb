class CreateLandfills < ActiveRecord::Migration[5.2]
  def change
    create_table :landfills do |t|
      t.string :area
      t.integer :status

      t.timestamps
    end
  end
end
