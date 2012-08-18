class AddResumeSrcToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :resume_src, :string
  end
end
