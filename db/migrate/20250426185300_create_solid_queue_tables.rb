class CreateSolidQueueTables < ActiveRecord::Migration[8.0]
  def change
    create_table :solid_queue_jobs do |t|
      t.string :queue_name, null: false
      t.string :task_name, null: false
      t.text :arguments
      t.integer :priority, default: 0, null: false
      t.timestamp :run_at
      t.timestamp :created_at, null: false
      t.timestamp :finished_at
    end

    add_index :solid_queue_jobs, [:queue_name, :priority, :run_at], name: "index_solid_queue_jobs_on_queue_priority_run"
  end
end
