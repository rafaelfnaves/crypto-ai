class CreateCryptos < ActiveRecord::Migration[7.1]
  def change
    create_table :cryptos do |t|
      t.string :name
      t.string :symbol
      t.float :price
      t.string :id_icon
      t.float :volume_1hrs
      t.float :volume_1day
      t.float :volume_1mth

      t.timestamps
    end
  end
end
