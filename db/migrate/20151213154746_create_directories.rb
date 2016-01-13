class CreateDirectories < ActiveRecord::Migration
  def change
    create_table :directories do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.text :description
      t.string :previous
      t.string :report_to
      t.string :office_location
      t.string :seating_zone
      t.string :fun_fact_one
      t.string :fun_fact_two
      t.string :fun_fact_three

      t.timestamps null: false
    end
  end
end
