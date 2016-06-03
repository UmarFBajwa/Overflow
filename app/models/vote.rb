class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates_presence_of :user, :voteable
  validates_uniqueness_of :user, { :scope => [:voteable_id, :voteable_type] }
end
