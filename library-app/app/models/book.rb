class Book < ActiveRecord::Base
  def self.search(search)
     where("title LIKE :search OR ISBN = :search2 OR author LIKE :search OR description LIKE :search OR status = :search2",search2: "#{search}",search: "%#{search}%")
  end
end
