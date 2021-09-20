class University < ApplicationRecord
    has_many :reviews
    has_many :programs
    has_many :careers, through: :programs

    validates :name, presence: true
    validates :location, presence: true
end
