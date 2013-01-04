class Page < ActiveRecord::Base
  attr_accessible :content, :navigable, :parent_id, :title

  has_many :pages, :foreign_key => :parent_id
  belongs_to :parent, :foreign_key => :parent_id, :class_name => :Page
  has_many :permissions, :as => :securable
end
