class Activity < ActiveRecord::Base

belongs_to :preference

  def self.find_activity(user)
    where(:activity_type_id => user.preference.activity_type_id)
  end

end