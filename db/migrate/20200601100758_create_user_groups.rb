class CreateUserGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :user_groups do |t|
      t.references :user, null: false, foreign_kye: true
      t.references :group, null: false, foreign_kye: true
      t.timestamps
    end
  end
end
