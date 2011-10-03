class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  has_many :comments
  scope :latest , order('updated_at desc')
  scope :public_entries, where('public_flag=1')
  validates :title, :body, :presence => true
end
