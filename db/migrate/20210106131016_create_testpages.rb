class CreateTestpages < ActiveRecord::Migration[5.2]
  def change
    create_table :testpages do |t|
      t.string :name
      t.string :place

      t.timestamps
    end
  end
end
