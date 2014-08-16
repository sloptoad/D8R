class Preference < ActiveRecord::Base

  belongs_to :user
  has_one :activity_type #belongs_to

#finds a match for the current user preferences 
end