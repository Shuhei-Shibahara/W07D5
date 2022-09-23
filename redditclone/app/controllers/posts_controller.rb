class PostsController < ApplicationController

    def create
        @post = Post.new(post_params)
        if @post&.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def new
        @post = Post.new
        render :new
    end

    def edit
        @post = Post.find_by_id(params[:id])
        render :edit
    end

    def update
        @post = Post.find_by_id(params[:id])
        if current_user.id == @post.author_id
            if @post&.update(post_params)
                redirect_to post_url(@post)
            else
                if @post
                    flash.now[:errors] = @post.errors.full_messages
                else
                    flash.now[:errors] = ["Could not update post"]
                end
            render :edit
            end
        end
        redirect_to sub_url(@post.sub)
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content)
    end
end
