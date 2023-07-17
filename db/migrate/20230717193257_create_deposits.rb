class CreateDeposits < ActiveRecord::Migration[5.2]
  def change
    create_table :deposits do |t|
      t.references :customer, foreign_key: true
      t.decimal :balance
      t.date :date

      t.timestamps
    end
  end
end
