class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.date :date
      t.string :location
      t.float :package
      t.text :description
      t.timestamps
    end
  end
end
