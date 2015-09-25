class Book < ActiveRecord::Base
	#before_save {self.title = title.capitalize, self.author = author.capitalize}
	validates :isbn, presence: true, uniqueness: true
	validates :title, presence: true
	validates :author, presence: true
  has_many :checkout_histories, dependent: :destroy
  has_many :users, through: :checkout_histories, dependent: :destroy

  def self.search(search)
     search = search.downcase
     where("lower(title) like :search OR isbn = :search2 OR lower(author) like :search OR lower(description) like :search OR status = :search2",search2: "#{search}",search: "%#{search}%")
  end
end
