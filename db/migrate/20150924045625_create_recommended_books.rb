class CreateRecommendedBooks < ActiveRecord::Migration
  def change
    create_table :recommended_books do |t|

      t.string :isbn
      t.string :title
      t.string :description
      t.string :author
      t.string :status, :default => "Under Review"
      t.string :comment
      t.references :user
      t.timestamps null: false
    end
  end
end