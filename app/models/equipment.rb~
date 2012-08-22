class Equipment < ActiveRecord::Base
  attr_accessible :gwaddr, :iosi, :iosu, :iosv, :ipseg, :mgmtip, :name, :notes, :serial, :wanip
  validates :serial => :presence=true
  belongs_to :office
  accepts_nested_attributes_for :office
end
