class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :is_user?, only: %i[index show]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  # GET /posts or /posts.json
  def index
    #@posts = Post.all
    @posts = Post.order(created_at: :desc).page(params[:page]).per(10)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    if current_user.role == 'admin'
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      #if @post.images.attached?
        @post.images.attach(params[:images])
      #end
      respond_to do |format|
        if @post.save
          format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { redirect_to @post, notice: "You do not have access to create a post."}
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if current_user.role == 'admin'
      #if @post.images.attached?
        @post.images.attach(params[:images])
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
    else
      format.html { redirect_to @post, notice: "You do not have access to create an edit."}
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :content, images: [])
    end
    def is_user?
      user_signed_in? == false || current_user.role == 'user'
    end
end
