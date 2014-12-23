class AddResumeToEmploymentApplication < ActiveRecord::Migration
  def self.up
    add_attachment :employment_applications, :resume
  end

  def self.down
    remove_attachment :employment_applications, :resume
  end
end
