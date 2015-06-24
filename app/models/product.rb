class Product < ActiveRecord::Base
  validates :name, presence: {message: I18n.t('product.errors.not_presence')},
            format: { without: /\s/, message: I18n.t('product.errors.with_space') }
  has_many :plans, dependent: :destroy
end
