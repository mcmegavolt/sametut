class AddVideoUrlToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :video_url, :string

  end
end
