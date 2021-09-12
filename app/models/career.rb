class Career < ApplicationRecord
    has_many :programs
    has_many :universities, through: :programs

    validates :career_name, presence: true
end
