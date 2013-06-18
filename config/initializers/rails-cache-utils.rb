Warden::Manager.after_set_user do |user, auth, opts|
  auth.cookies[:user_id] = user.id
end

Warden::Manager.before_logout do |user, auth, opts|
  auth.cookies.delete :user_id
end
