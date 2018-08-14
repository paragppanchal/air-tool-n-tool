class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end
  def show
    @tool = Tool.find(params[:id])
  end
  def new
    @user = User.find(params[:user_id])
    @tool = Tool.new(user: @user)
  end
  def create
    @tool = Tool.new(tool_params)

  end

  private
  def tool_params
    params.require(:tool).permit(:price_per_day)
  end

end
