class ToolsController < ApplicationController

  before_action :set_tool, only: [:show, :edit, :update, :destroy]
  after_action :authorize_access, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @tools = policy_scope(Tool)
    @flats = Tool.where.not(latitude: nil, longitude: nil)

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude#,
      }
    end
  end

  def show
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    @tool.save
  end

  def edit
  end

  def update
    @tool.update(tool_params)
  end

  def destroy
    @tool.destroy
  end

  private

  def tool_params
    params.require(:tool).permit(:title, :price_per_day)
  end

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def authorize_access
    authorize @tool
  end
end
