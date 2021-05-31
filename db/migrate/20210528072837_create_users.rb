class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end

# rails console
# ActiveRecord::Migration.remove_column :users, :name
# ActiveRecord::Migration.add_column :users, :first_name, :string
