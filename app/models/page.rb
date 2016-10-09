class Page < ApplicationRecord

  # Indicate the foreign key in table
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => 'AdminUser' #, :join_table => 'custom join table name'

  acts_as_list :scope => :subject

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255
  # validates_presence_of :permalink
  # validates_length_of :permalink, :within => 3..255
  # use presence of with length_of to disallow spaces
  # validates_uniqueness_of :permalink
  # for unique values by subject use ':scope => :subject_id'

  validates :name, :presence => true,
                   :length => { :maximum => 255 }
  validates :permalink, :presence => true,
                        :length => { :within => 3..255 },
                        :uniqueness => true

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order('pages.position ASC') }
  scope :newest_first, lambda { order('pages.created DESC') }

end
