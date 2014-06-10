class Event < ActiveRecord::Base
  belongs_to :organiser, :class_name => 'User'
  has_many :users, through: :debts
  has_many :debts
end