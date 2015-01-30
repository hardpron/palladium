class TestCase < ActiveRecord::Base
  validates :title, presence: true
end
