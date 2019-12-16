class Complain < ApplicationRecord

  belongs_to :user
  belongs_to :area

  validates :body,presence: true,  format: {with: /(.*)/, msg: ' 10 y 100 '}
  
end
