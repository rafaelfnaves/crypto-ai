class CreateWalletCryptos < ActiveRecord::Migration[7.1]
  def change
    create_table :wallet_cryptos do |t|
      t.references :wallet, null: false, foreign_key: true
      t.references :crypto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
