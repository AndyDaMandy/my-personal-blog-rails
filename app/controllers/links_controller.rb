class LinksController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :ensure_admin, only: [:create, :edit, :update, :destroy]
    def index
        @links = Link.all
    end
    def new
        @link = Link.new
    end
    def create
        @link = Link.new(link_params)
        @link.user = current_user
        if @link.save
            redirect_to home_path
        else
            render :new
        end
    end
    # def show
    #     @link = Link.find(params[:id])
    # end
    def edit
        @link = Link.find(params[:id])
    end
    def update
        @link = Link.find(params[:id])
        if @link.update(link_params)
            redirect_to home_path
        else
            render :edit
        end
    end
    def destroy
        @link = Link.find(params[:id])
        @link.destroy
        redirect_to home_path
    end

    private
    
    def link_params
        params.require(:link).permit(:url_name, :url, :user_id)
    end

end
