class Product < ActiveRecord::Base
  has_many :plans, dependent: :destroy
end
