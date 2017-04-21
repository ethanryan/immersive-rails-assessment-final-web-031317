class Appearance < ApplicationRecord
  belongs_to :guest
  belongs_to :episode

  #validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :rating, :inclusion => {:in => [1,5]}
  #hope this is the right syntax
end
