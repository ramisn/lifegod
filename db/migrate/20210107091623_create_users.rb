class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :comments
      t.string :status
      t.string :misc
      t.text :preferences
      t.boolean :terms
      t.string :type

      t.timestamps
    end
  end
end
