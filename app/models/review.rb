class Review < ApplicationRecord
  belongs_to :university
  belongs_to :user
end
