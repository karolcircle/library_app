class Lending < ApplicationRecord
  belongs_to :book  
  belongs_to :user
  validates :book_id, :user_id, presence: true
end
