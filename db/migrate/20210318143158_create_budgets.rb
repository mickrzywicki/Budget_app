class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.string :title
      t.string :comment
      t.float :price

      t.timestamps
    end
  end
end
