class Category < ActiveRecord::Base
  belongs_to :topic
  has_many :notes
end
