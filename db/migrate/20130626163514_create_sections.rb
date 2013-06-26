class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :long_name
      t.string :short_name

      t.timestamps
    end
  end
end
