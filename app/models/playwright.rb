class Playwright < ApplicationRecord
  has_many :plays, dependent: :destroy

  validates :last_name, presence: true

  def name
    first_name + ' ' + last_name
  end
end
