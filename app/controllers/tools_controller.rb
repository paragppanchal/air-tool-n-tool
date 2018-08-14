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
    @user = User.find(params[:user_id])
    @tool.user = @user
    @tool.save
  end
  def edit
    @tool = Tool.find(params[:id])
  end
  def update
    @tool = Tool.find(params[:id])
    @tool.update(tool_params)
  end
  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
  end

  private
  def tool_params
    params.require(:tool).permit(:price_per_day)
  end

end
