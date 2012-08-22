class Office < ActiveRecord::Base
  attr_accessible :address, :name
  validates :name => :presence=true
  has_many :equipments, :dependent => :destroy
end
