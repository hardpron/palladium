class Plan < ActiveRecord::Base
  validates :name, presence: true, format: { without: /\s/ }
  belongs_to :product
  has_many :runs, dependent: :destroy
  serialize :status
end
