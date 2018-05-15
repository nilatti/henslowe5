class Play < ApplicationRecord
  belongs_to :playwright
  has_many :productions, dependent: :destroy
end
