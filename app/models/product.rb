class Product < ActiveRecord::Base
  validates :name, {presence: true}
  validates :status, {presence: true}
  validates :version, {presence: true}
  validates :update_data, {presence: true}
end
