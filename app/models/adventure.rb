class Adventure < ApplicationRecord
  belongs_to :user, touch: true
  has_many :messages
  broadcasts_refreshes
end
