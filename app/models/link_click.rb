class LinkClick < ActiveRecord::Base
  validates :link_id, :presence => true, :numericality => { :only_integer => true }
  validates :referrer, :presence => true

  belongs_to :link
end
