class AddImageUrlToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :image_url, :string
  end
end
