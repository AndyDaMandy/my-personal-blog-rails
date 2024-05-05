# frozen_string_literal: true

# Controller for posts
class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :ensure_admin, only: %i[new create edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = if params[:search]
               Post.find_title(params[:search]).order(created_at: :desc).page(params[:page]).per(10)
             else
               Post.order(created_at: :desc).page(params[:page]).per(10)
             end
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
      @post = Post.new(post_params)
      @post.user = current_user
      # @post.images.attached?
      # @post.images.attach(params[:images])
      # #end
      respond_to do |format|
        if @post.save
          format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
      #if @post.images.attached?
      # @post.images.attach(params[:images])
      #end
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def rss_feed
    @posts = Post.order(created_at: :desc).limit(5)
    respond_to do |format|
      format.xml { render layout: false }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :description, :content, images: [])
  end

  # def is_user?
  #   user_signed_in? == false || current_user.role == 'user'
  # end

  # def ensure_admin
  #   if current_user.role != 'admin'
  #     raise ActionController::RoutingError, 'Not Found'
  #   end
  # end

end
