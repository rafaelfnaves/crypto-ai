class CreateWallets < ActiveRecord::Migration[7.1]
  def change
    create_table :wallets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :crypto, null: false, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
