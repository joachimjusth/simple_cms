class Page < ApplicationRecord

  # Indicate the foreign key in table
  belongs_to :subject
  has_and_belongs_to_many :editors, :class_name => 'AdminUser' #, :join_table => 'custom join table name'

end
