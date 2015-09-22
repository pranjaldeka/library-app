class Book < ActiveRecord::Base
	validates :ISBN, presence: true, uniqueness: true
	validates :title, presence: true
	validates :author, presence: true
end
