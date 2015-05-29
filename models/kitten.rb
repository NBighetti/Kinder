class Kitten < ActiveRecord::Base
  has_many :judgements
  has_many :users, through: :judgements
end
