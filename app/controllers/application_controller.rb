class ApplicationController < ActionController::API
    include ActionController::Cookies
    rescue_from StandardError, with: :standard_error

    def app_response(message: 'success', status: 200, data: nil)
        render json: {
            message: message,
            data: data
        }, status: status
    end

    #store user id in session
    def save_user(id)
        session[:uid] = id
        session[:expiry] = 6.hours.from_now
    end

    #delete user id from session
    def remove_user
        session.delete(:uid)
        session[:expiry] = Time.now
    end

    #check for session expiry
    def session_expired?
        session[:expiry] ||= Time.now
        time_diff = (Time.parse(session[:expiry]) - Time.now).to_i
        unless time_diff > 0
            app_response(message: 'failed', status: 401, data: {info: 'Your session has expired, please login to continue'})
        end
    end

    #get logged in user id
    def user
        User.find(session[:uid].to_i)
    end

    #rescue all common erros
    def standard_error(e)
        app_response(message: 'Failed!',data: {info: e.message}, status: :unprocessable_entity)
    end
end
