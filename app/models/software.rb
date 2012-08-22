class Software < ActiveRecord::Base
  has_and_belongs_to_many :servers
  accepts_nested_attributes_for :servers
  attr_accessible :name, :status, :version
  validates :name, :presence => true
  validates :status, :presence => true

  def self.search(search)
     if search
        find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
     else
        find(:all)
     end
  end
end
