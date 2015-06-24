class Product < ActiveRecord::Base
  validates :name, presence: {message: I18n.t('product.errors.not_presence')}
  has_many :plans, dependent: :destroy
end
