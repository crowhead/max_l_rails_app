class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :steps
end
