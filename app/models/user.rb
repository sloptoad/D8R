class User < ActiveRecord::Base

  has_one :preference
  validates :username, :password, :img, :age, :gender, :bio, presence: true


  def self.gender_matches(user)
    where(:gender => user.preference.gender_pref)
  end

  def self.age_matches(user)
    User.where('users.age >= ? AND users.age < ?', user.preference.min_age, user.preference.max_age)
  end

  # def self.activity_matches(user)
  #   User.preference.where('preferences.activity_type_id = ? AND user.id != ?', user.preference.activity_type.id, user.id) 
  # end

  private

  def male?
    self.gender == 'male'
  end

  def female?
    self.gender == 'female'
  end

  def self.find_matches(user)
    u = gender_matches(user).age_matches(user)
    # .activity_matches(user)
  end

  def self.generate_date
    dates = ['milanos', 'starbucks', 'revolver'][ rand(3) ]
    if dates == 'milanos'
      return "Milanos!<br><a href='http://www.milanocoffee.ca/'><img src='http://www.jenellisdesigns.com/sites/jenellisdesigns.com/files/march%202nd%20jen%202012%20073.JPG' target='_blank'><br>On 36 Powell St</a>"
    elsif dates == 'starbucks'
      return "Starbucks! <br><a href='http://www.starbucks.ca/store/1110/ca/gastown/199-water-street-vancouver-bc-v6b-1a7' target='_blank'><img src='http://www.oakvilledowntown.com/sites/default/files/Starbucks.gif'><br>On 199 Water Street</a>"
    else dates == 'revolver'
      return "Revolver!<br><a href='http://revolvercoffee.ca/'><img src='http://urbandiner.ca/wp-content/uploads/2011/09/revolver-cafe.jpg' target='_blank'><br>On 325 Cambie St</a>"
    end
  end

end