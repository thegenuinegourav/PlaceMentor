class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :name, :username
    rename_column :companies, :name, :companyname
  end
end
