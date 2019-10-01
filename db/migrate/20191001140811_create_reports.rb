class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :reportable, polymorphic: true
      t.references :user, foreign_key: true
      t.integer :status
      t.integer :level
      t.text :note
      t.string :image
      t.integer :report_type

      t.timestamps
    end
  end
end
