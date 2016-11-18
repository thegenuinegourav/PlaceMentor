class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :like, :user_id, :company_id
    end
  end
end
