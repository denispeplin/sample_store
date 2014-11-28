class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name, index: true
      t.integer :number

      t.timestamps
    end
  end
end
