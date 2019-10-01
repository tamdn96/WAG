class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.references :positionable, polymorphic: true
      t.float :lat
      t.float :long
      t.text :address

      t.timestamps
    end
  end
end
