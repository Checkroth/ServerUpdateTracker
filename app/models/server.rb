class Server < ActiveRecord::Base
  attr_accessible :name, :os, :phys
  validates :name, :presence => true
  has_and_belongs_to_many :softwares
  accepts_nested_attributes_for :softwares

  def self.search(search)
     if search
        find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
     else
        find(:all)
     end
  end
end
