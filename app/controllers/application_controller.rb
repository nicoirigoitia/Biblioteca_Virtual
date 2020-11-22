class ApplicationController < ActionController::Base
    # def find_user
    #     User.find(loan.user_id).email
    # end
    # helper_method :find_user
    protect_from_forgery with: :exception

    before_action :authenticate_user!


end
