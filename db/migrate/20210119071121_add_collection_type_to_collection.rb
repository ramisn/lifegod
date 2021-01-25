class AddCollectionTypeToCollection < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :collection_type, :string
  end
end
