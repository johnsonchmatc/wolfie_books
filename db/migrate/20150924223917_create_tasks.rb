class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :employee_name
      t.integer :time
      t.date :date
      t.text :description

      t.timestamps null: false
    end
  end
end
