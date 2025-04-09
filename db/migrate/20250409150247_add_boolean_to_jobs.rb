class AddBooleanToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :system, :boolean
  end
end
