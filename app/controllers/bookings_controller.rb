class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  after_action :authorize_access, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show

  end

  def new
    @tool = Tool.find(params[:tool_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @tool = Tool.find(params[:tool_id])
    @booking.tool = @tool
    if @booking.save
      redirect_to root_url
    else
      render 'new'
    end
  end


  def edit
    @tool = Tool.find(params[:tool_id])
  end

  def update
    @booking.update(booking_params)

  end

  def destroy
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def authorize_access
    authorize @tool
  end
end
