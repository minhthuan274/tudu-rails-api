class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :isComplete, default: false
      t.references :task, foreign_key: true

      t.timestamps
    end
    add_index :todos, [:task_id, :created_at]
  end
end
