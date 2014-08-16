class UserPreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :user
      t.string :gender_pref
      t.integer :min_age
      t.integer :max_age
      t.references :activity_type
    end
  end
end
