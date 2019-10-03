class AddColumnsUsersAuthenticate < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :token, :string
    add_column :users, :expires_in, :datetime
  end
end
