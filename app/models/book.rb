class Book < ActiveRecord::Base
	validates :ISBN, presence: true, uniqueness: true
	validates :title, presence: true
	validates :author, presence: true
  has_many :checkout_histories
  has_many :users, through: :checkout_histories

  def self.search(search)
     where("title LIKE :search OR ISBN = :search2 OR author LIKE :search OR description LIKE :search OR status = :search2",search2: "#{search}",search: "%#{search}%")
  end
end
