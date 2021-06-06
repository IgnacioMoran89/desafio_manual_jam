module UsersHelper

    #metodo devuelve si usuario está conectado o no
    def user_logged_in?
        (session[:user_id].present?) ? true : false
    end
    
    #metodo para definir que usuario está conectado en este momento
    def current_user
        User.find(session[:user_id]) unless session[:user_id].nil?
    end

end
