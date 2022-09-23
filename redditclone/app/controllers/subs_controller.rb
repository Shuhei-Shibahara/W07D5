class SubsController < ApplicationController
    before_action :require_logged_in, [:]
    def index
        @subs = Sub.all
        render :index
    end

    def create
        @sub = Sub.new(sub_params)
        if @sub&.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def new
        @sub = Sub.new
        render :new
    end

    def edit
        @sub = Sub.find_by_id(params[:id])
        render :edit
    end

    def show
        @sub = Sub.find_by_id(params[:id])
        render :show
    end

    def update
        @sub = Sub.find_by_id(params[:id])
        if current_user.id == @sub.
        if @sub&.update(sub_params)
            redirect_to sub_url(@sub)
        else
            if @sub
                flash.now[:errors] = @sub.errors.full_messages
            else
                flash.now[:errors] = ["Could not update sub"]
            end
        render :edit
        end
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
