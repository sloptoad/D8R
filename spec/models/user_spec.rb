require_relative '../spec_helper.rb'

describe User do 

  before(:each) do
    @girl = create(:user, :gender => 'female', :age => 26 )
    @guy1 = create(:user, :gender => 'male', :age => 30 )
    @guy2 = create(:user, :gender => 'male', :age => 50 )
    @guy3 = create(:user, :gender => 'male', :age => 40 )
    @activity_type = create(:activity_type)
    @preference = create(:preference, :user => @girl, :gender_pref => 'male', :activity_type => @activity_type)
    @preference = create(:preference, :user => @guy2, :activity_type => @activity_type)
    @preference = create(:preference, :user => @guy1, :activity_type => @activity_type)
    @preference = create(:preference, :user => @guy3)
  end

  describe 'gender_matches' do


    it 'should match the males' do
      expect( User.gender_matches(@girl).to_a ).to eq([@guy1,@guy2,@guy3])
    end

  end

  describe 'age_matches' do

    it 'should match people in the right age range' do
      expect( User.age_matches(@girl).to_a ).to eq([@guy1])
    end

  end

   describe 'activity_matches' do

    it 'should match people with the same activity preference' do
      expect( User.activity_matches(@girl).to_a ).to eq([@guy2, @guy1])
    end

  end

  describe 'find_matches' do 

    it 'should match only people who are complete matches' do
      expect( User.find_matches(@girl).to_a ).to eq([@guy1])
    end

  end


  
end