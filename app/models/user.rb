class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 200 },
	format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6, maximum: 25 }, allow_nil: true

	has_many :checkout_histories, dependent: :destroy
	has_many :books, through: :checkout_histories, dependent: :destroy
	has_many :recommended_books, dependent: :destroy
end
