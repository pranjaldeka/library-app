class CreateCheckoutHistories < ActiveRecord::Migration
  def change
    create_table :checkout_histories do |t|
      t.datetime :issued_at
      t.datetime :returned_at

      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      t.timestamps null: false
    end
  end
end
