class CreateTableF1 < ActiveRecord::Migration[7.2]
  def change
    create_table :f1s do |t|
      t.string :name
      t.string :description
      t.integer :maximum_speed
      t.timestamps
    end
  end
end
