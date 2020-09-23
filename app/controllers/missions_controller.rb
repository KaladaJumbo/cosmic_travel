class MissionsController < ApplicationController

    def index

        @missions = Mission.all

    end

    def show

        @mission = Mission.find(params[:id])
         
    end

    def new

        @mission = Mission.new

    end

    def create

        mission = Mission.create(strong_param(:name, :planet_id, :scientist_id))
        redirect_to mission_path(mission)

    end

    def edit

    end

    def update

    end

    def delete 

    end

    private 

    def strong_param(*args)

        params.require(:mission).permit(*args)

    end

end
