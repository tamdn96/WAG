class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :time_start
      t.text :desc
      t.integer :status
      t.integer :level
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
