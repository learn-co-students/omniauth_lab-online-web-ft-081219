class SessionsController < ApplicationController 
    def create 
        user = User.find_by(name: auth["info"]["name"])
        if  user 
            session[:user_id] = user.id
        else 
           user = User.create(email: auth["info"]["email"], name: auth["info"]["name"], uid: auth["uid"].to_i)
           session[:user_id] = user.id
        end
    
    end

    private 
    def auth 
        request.env["omniauth.auth"]
    end
end