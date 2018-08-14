class ToolsController < ApplicationController

  before_action: :set_tool, only: [:show, :edit, :update, :destroy]

  def index
    @tools = Tool.all
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @tool = Tool.new(user: @user)
  end

  def create
    @tool = Tool.new(tool_params)
    @user = User.find(params[:user_id])
    @tool.user = @user
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
    params.require(:tool).permit(:price_per_day)
  end

  def set_tool
    @tool = Tool.find(params[:id])
  end

end
