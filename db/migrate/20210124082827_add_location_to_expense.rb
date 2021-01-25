class AddLocationToExpense < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :location, :string
  end
end
