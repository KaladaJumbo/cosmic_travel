class ScientistsController < ApplicationController

    def index

        @scientists = Scientist.all
        render 'index'
    end

    def show

        @scientist = Scientist.find(params[:id])
        render 'show'
    end

    def new

        @scientist = Scientist.new
        render 'new'

    end

    def create
        @scientist = Scientist.create(strong_param(:name, :field_of_study))
        if @scientist.save
            redirect_to scientist_path(scientist)
        else 
            render 'new'
        end
    end

    def edit

        @scientist = Scientist.find(params[:id])
        render 'edit'

    end

    def update
        @scientist = Scientist.find(params[:id])
        @scientist.update(strong_param(:name, :field_of_study))

        if @scientist.save
            redirect_to scientist_path(@scientist)
        else
            render 'edit'
        end

    end

    def destroy 

        scientist = Scientist.find(params[:id])
        scientist.destroy
        redirect_to scientists_path

    end

    private 

    def strong_param(*args)

        params.require(:scientist).permit(*args)

    end

end
