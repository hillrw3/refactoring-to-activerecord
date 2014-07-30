require "active_record"

class Fish < ActiveRecord::Base

  belongs_to :user
  validates :name, :wikipedia_page, :user_id, presence: true

end