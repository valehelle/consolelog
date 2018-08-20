class LogController < ApplicationController
    before_action :authenticate_user!
    def create
        @log = current_user.projects.find_by(title: params[:title]).logs.create(log_params)
         
        render :json => @log
    end

    private
    def log_params
      params.permit(:content)
    end
end
