helpers do
  def get_current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :'index'
end

get '/profile' do
  erb :'profile'
end

post '/' do
  @user = User.new(
    username: params[:username],
    password: params[:password],
    img:  params[:img],
    age: params[:age],
    gender: params[:gender],
    bio: params[:bio]
  )
  if @user.save
    session[:user_id] = @user.id
    redirect '/profile'
  else
    erb :'index' 
  end
end

get '/login' do
  erb :'/login'
end

post '/login' do
  @user = User.find_by(
    username: params[:username],
    password: params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/profile'
    @login_failed = false
  else
    @login_failed = true
    erb :'/login'
  end
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end

post '/profile' do

  @preference = get_current_user.preference
  if @preference.nil?
      @preference = Preference.create(
      user_id: session[:user_id].to_i,
      gender_pref: params[:gender_pref],
      min_age: params[:min_age],
      max_age: params[:max_age],
      activity_type_id: params[:activity_type_id])
      @preference.save
  else
      @preference.update_attributes(
        user_id: session[:user_id].to_i, 
        gender_pref: params[:gender_pref], 
        min_age: params[:min_age],
        max_age: params[:max_age],
        activity_type_id: params[:activity_type_id])
      @preference.save
  end
  redirect '/profile'
end


get '/find_match' do
  @random_date = User.generate_date
  @current_user = get_current_user
  @matches = User.find_matches(get_current_user)
  @dates = Activity.find_activity(get_current_user)
  erb :'/find_match'
end