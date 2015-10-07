class CreateEmailNotifications < ActiveRecord::Migration
  def change
    create_table :email_notifications do |t|
      t.boolean :sent, default: false

      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      t.timestamps null: false
    end
  end
end
