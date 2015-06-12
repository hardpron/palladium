class Status < ActiveRecord::Base
  has_many :results
  validates :name, presence: true
  validates :color, length: {is: 7},
            presence: true

  validates_each :color do |record, attr, value|
    if value[0] == '#'
      value[1..6].downcase.each_char do |current_char|
        unless '1234567890abcdef'.include? current_char
          record.errors.add(attr, "data is not correct. Use hex color data - only numbers and symbols 'abcdef' or 'ABCDEF'")
        end
      end
    else
      value.errors.add(attr, "Need to add symbol '#' in the beginning of the word")
    end
  end
end