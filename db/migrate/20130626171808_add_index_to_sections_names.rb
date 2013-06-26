class AddIndexToSectionsNames < ActiveRecord::Migration
  def change
    add_index :sections, :long_name, unique: true
    add_index :sections, :short_name, unique: true
  end
end
