class CreateGarbages < ActiveRecord::Migration[5.2]
  def change
    create_table :garbages do |t|
      t.string :qrcode
      t.string :name
      t.string :area
      t.integer :status
      t.integer :level
      t.string :image

      t.timestamps
    end
  end
end
