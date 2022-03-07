class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.float :price
      t.date :paid_on

      t.timestamps
    end
  end
end
