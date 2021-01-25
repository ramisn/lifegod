class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :cl_date
      t.string :location
      t.integer :tag_id
      t.string :name
      t.float :amount
      t.float :balance
      t.float :fix_amount

      t.timestamps
    end
  end
end
