class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :position
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
