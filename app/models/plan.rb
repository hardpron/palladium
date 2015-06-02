class Plan < ActiveRecord::Base
  belongs_to :product
  has_many :runs, dependent: :destroy
end
