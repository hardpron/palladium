class Product < ActiveRecord::Base
  validates :name, presence: true
  has_many :plans, dependent: :destroy
end
