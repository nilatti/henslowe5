class Production < ApplicationRecord
  belongs_to :theater
  belongs_to :play
end
