class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :student_name
      t.string :course_name
      t.string :course_desc
      t.string :generated_at
      t.string :hash
    end
  end
end
