class Page < ApplicationRecord

  # Indicate the foreign key in table
  belongs_to :subject
  has_and_belongs_to_many :editors, :class_name => 'AdminUser' #, :join_table => 'custom join table name'

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order('pages.position ASC') }
  scope :newest_first, lambda { order('pages.created DESC') }

end
