class Theater < ApplicationRecord
  has_many :productions, dependent: :destroy
  has_many :plays, through: :productions

  validates :name, presence: true
end
