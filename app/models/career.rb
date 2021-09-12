class Career < ApplicationRecord
    has_many :programs
    has_many :universities, through: :programs
end
