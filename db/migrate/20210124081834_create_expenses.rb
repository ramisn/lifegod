class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :expense_type
      t.text :description
      t.float :amount
      t.string :owner

      t.timestamps
    end
  end
end
