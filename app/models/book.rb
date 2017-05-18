class Book < ApplicationRecord
  has_many :lendings
  validates :title, :author, presence: true
  
  def self.count_available
    group([:title, :author]).available.count
  end

  def self.available
    where("available = 'true'")    
  end

  def lend_book
    update_attributes(available: false)
  end

  def return_book
    update_attributes(available: true)
  end
end
