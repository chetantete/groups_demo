class Api::V1::GroupsController < ApplicationController
  before_action :set_group, only: [:show]
  before_action :set_user

  # GET /groups
  # GET /groups.json
  def index
    @groups = @current_user.groups
    render json: { status: 200, data: @groups}
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :fb_id, :description, :privacy, :user_id)
    end
end
