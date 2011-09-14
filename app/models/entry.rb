class Entry < ActiveRecord::Base
  belongs_to :blogger
  has_many :comments
  scope :latest , order('updated_at desc')
end
