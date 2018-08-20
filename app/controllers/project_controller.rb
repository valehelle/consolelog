class ProjectController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @projects = current_user.projects
       
        render :json => @projects
    end
    def create
        if !current_user.projects.find_by(title: params['title'])
            @project = current_user.projects.create(project_params)
        else
            @project = {
                'success': false,
                'description': 'Project name already exists'
            }
        end


        render :json => @project
    end
    def show
        @project = current_user.projects.find_by(title: params[:title])
        render :json => @project.to_json(:include => :logs)
    end

    private
    def project_params
      params.permit(:title)
    end
end
