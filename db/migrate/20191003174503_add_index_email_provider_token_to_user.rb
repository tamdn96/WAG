class AddIndexEmailProviderTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_index :users, [:email, :provider], unique: true
    add_index :users, [:email, :provider, :token]
  end
end
