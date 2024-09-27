class Response < ApplicationRecord
  belongs_to :message, touch: true
  broadcasts_refreshes
end
