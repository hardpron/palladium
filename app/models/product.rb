class Product < ActiveRecord::Base
  validates :name, presence: true, format: { without: /\s/ }
  has_many :plans, dependent: :destroy
end
