class Room < ApplicationRecord
  has_maany :messages
  validates :name, presence: true
end
