class CreateLendings < ActiveRecord::Migration[5.0]
  def change
    create_table :lendings do |t|
      t.references :book, foreign_key: true      
      t.date :date_out
      t.date :date_in

      t.timestamps
    end
  end
end
