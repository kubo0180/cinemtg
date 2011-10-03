class Book < ActiveRecord::Base
  has_many :entries
  scope :latest , order('updated_at desc')
end
