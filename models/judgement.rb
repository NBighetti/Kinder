class Judgement < ActiveRecord::Base
  belongs_to :kitten
  belongs_to :user
end
