class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    #before_action :authorize!, only: [:edit, :update, :destroy]

    def index

        @posts=Post.all

    end

    def new

        @post=Post.new

    end

    def create
        @post=Post.new post_params
        if @post.save
            flash[:notice] = 'Post created successfully'
           
            redirect_to post_path(@post)
        else
            render :new
        end

    end

    def show
        @comment = Comment.new
       

        @comments = @post.comments.order(created_at: :desc)
    end

    def edit

    end

    def update
        if @post.update post_params
            redirect_to post_path(@post)
        else
            render :edit
        end

    end

    def destroy
       
        @post.destroy 
        redirect_to posts_path

    end

    private
    def post_params
        params.require(:post).permit(:title, :body)

    end

    private
    def find_post

       @post=Post.find params[:id]
    end
    #def authorize! 
     #   redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @post)
   # end


end
