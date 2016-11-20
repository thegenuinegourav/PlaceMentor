class CreateCompanyBranches < ActiveRecord::Migration
  def change
    create_table :company_branches do |t|
      t.integer :company_id, :branch_id
    end
  end
end
