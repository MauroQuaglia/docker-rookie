class CreateTableF1 < ActiveRecord::Migration[7.2]
  def change
    create_table :table_f1s do |t|
      t.string :name
      t.string :description
      t.value :integer
      t.timestamps
    end
  end
end
