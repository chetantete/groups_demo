class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :set_user

  # GET /posts
  # GET /posts.json
  def index
    groups = @current_user.groups.ids
    @posts = Post.where(group_id: groups)
    render json: { status: 200, data: @posts}
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id]) rescue ""
      render json: { status: 403, error: true, message: "post not found"} if @post.blank?
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:message, :fb_id, :updated_time, :group_id)
    end
end
