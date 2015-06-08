class Plan < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :product
  has_many :runs, dependent: :destroy
end
