class Iteration < ApplicationRecord
  validates :element, presence: true
  validates :element, uniqueness: true
  validates :square, presence: true
  validates :square, uniqueness: true  
end
