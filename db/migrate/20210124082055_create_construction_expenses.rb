class CreateConstructionExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :construction_expenses do |t|
      t.text :material_description
      t.float :amount
      t.string :owner

      t.timestamps
    end
  end
end
