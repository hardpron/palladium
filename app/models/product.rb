class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :status, presence: true
  validates :version, presence: true
  validates :update_data, presence: true
  has_and_belongs_to_many :runs
end
