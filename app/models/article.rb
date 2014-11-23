class Article < ActiveRecord::Base
  belongs_to :category
  validates :title, :price_in_dollars, :description, :owner_email, presence: true
end
