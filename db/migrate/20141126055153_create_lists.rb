class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :type, index: true
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
